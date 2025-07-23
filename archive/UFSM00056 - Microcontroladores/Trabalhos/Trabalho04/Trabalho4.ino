#include <Wire.h>                 // I2C para ADC, LCD, HMC5883L
#include <SPI.h>                  // SPI para MPU 6250
#include <LiquidCrystal_I2C.h>    // LCD via I2C
#include <Adafruit_ADS1X15.h>     // ADC AD1115

// Endereços e pinos
#define HMC5883L_ADDRESS 0x1E
#define MPU_CS_PIN 53            // CS para MPU 6250 no Mega (pino 53)
#define HC_TRIGGER_PIN 9
#define HC_ECHO_PIN 10

// Inicializações
LiquidCrystal_I2C lcd(0x27, 16, 2); // Endereço típico LCD I2C, ajuste se precisar
Adafruit_ADS1115 ads;                // ADC ADS1115

// Variáveis para UART
String inputString = "";
bool stringComplete = false;

void setup() {
  Serial.begin(9600);        // Serial monitor via USB (UART0)

  Wire.begin();              // I2C no Mega (SDA=20, SCL=21)
  SPI.begin();               // SPI no Mega (MOSI=51, MISO=50, SCK=52)

  pinMode(MPU_CS_PIN, OUTPUT);
  digitalWrite(MPU_CS_PIN, HIGH);

  lcd.init();
  lcd.backlight();

  ads.begin();

  initHMC5883L();
  initMPU6250();

  pinMode(HC_TRIGGER_PIN, OUTPUT);
  pinMode(HC_ECHO_PIN, INPUT);

  Serial.println("Sistema inicializado no Mega 2560. Aguardando comandos...");
}

void loop() {
  if (stringComplete) {
    parseCommand(inputString);
    inputString = "";
    stringComplete = false;
  }
}

// Captura comandos da serial
void serialEvent() {
  while (Serial.available()) {
    char inChar = (char)Serial.read();
    if (inChar == '\n' || inChar == '\r') {
      if (inputString.length() > 0) stringComplete = true;
    } else {
      inputString += inChar;
    }
  }
}

// Processa comandos recebidos
void parseCommand(String command) {
  command.trim();

  if (command.startsWith("LCD write")) {
    int firstQuote = command.indexOf('\"');
    int lastQuote = command.lastIndexOf('\"');
    if (firstQuote != -1 && lastQuote != -1 && lastQuote > firstQuote) {
      String text = command.substring(firstQuote + 1, lastQuote);
      lcd.clear();
      lcd.print(text);
      Serial.println("LCD escrito: " + text);
    } else {
      Serial.println("Erro: formato inválido para LCD write.");
    }

  } else if (command == "ADC read") {
    int16_t adc0 = ads.readADC_SingleEnded(0);
    Serial.print("ADC Read: ");
    Serial.println(adc0);

  } else if (command == "HMC read") {
    float heading = readHMC5883L();
    if (heading >= 0) {
      Serial.print("HMC Read (Heading): ");
      Serial.println(heading);
    } else {
      Serial.println("Erro ao ler HMC5883L");
    }

  } else if (command == "MPU read") {
    float accelX = readMPU6250();
    Serial.print("MPU Read (Accel X): ");
    Serial.println(accelX);

  } else if (command == "HC read") {
    int hcValue = readHC();
    Serial.print("HC Read (Proximity): ");
    Serial.println(hcValue);

  } else {
    Serial.println("Comando não reconhecido.");
  }
}

// Inicializa HMC5883L via I2C
void initHMC5883L() {
  Wire.beginTransmission(HMC5883L_ADDRESS);
  Wire.write(0x00);  // Config Reg A
  Wire.write(0x70);  // 8-average, 15Hz, normal measurement
  Wire.endTransmission();

  Wire.beginTransmission(HMC5883L_ADDRESS);
  Wire.write(0x01);  // Config Reg B
  Wire.write(0xA0);  // Ganho
  Wire.endTransmission();

  Wire.beginTransmission(HMC5883L_ADDRESS);
  Wire.write(0x02);  // Mode Reg
  Wire.write(0x00);  // Continuous measurement
  Wire.endTransmission();
}

// Leitura do sensor HMC5883L (heading em graus)
float readHMC5883L() {
  Wire.beginTransmission(HMC5883L_ADDRESS);
  Wire.write(0x03);
  Wire.endTransmission();

  Wire.requestFrom(HMC5883L_ADDRESS, 6);
  if (Wire.available() == 6) {
    int16_t x = Wire.read() << 8 | Wire.read();
    int16_t z = Wire.read() << 8 | Wire.read();
    int16_t y = Wire.read() << 8 | Wire.read();

    float heading = atan2((float)y, (float)x) * 180 / PI;
    if (heading < 0) heading += 360;
    return heading;
  }
  return -1; // erro
}

// Inicializa MPU 6250 via SPI
void initMPU6250() {
  SPI.beginTransaction(SPISettings(1000000, MSBFIRST, SPI_MODE0));
  digitalWrite(MPU_CS_PIN, LOW);
  SPI.transfer(0x6B); // PWR_MGMT_1 register
  SPI.transfer(0x00); // Despertar
  digitalWrite(MPU_CS_PIN, HIGH);
  SPI.endTransaction();
}

// Leitura do acelerômetro X via SPI no MPU 6250
float readMPU6250() {
  SPI.beginTransaction(SPISettings(1000000, MSBFIRST, SPI_MODE0));
  digitalWrite(MPU_CS_PIN, LOW);
  SPI.transfer(0x3B | 0x80); // ACCEL_XOUT_H + read bit
  byte high = SPI.transfer(0x00);
  byte low = SPI.transfer(0x00);
  digitalWrite(MPU_CS_PIN, HIGH);
  SPI.endTransaction();

  int16_t accelX = (high << 8) | low;
  float accelX_g = accelX / 16384.0; // sensibilidade padrão ±2g
  return accelX_g;
}

// Leitura simples do sensor HC (proximidade)
// Supondo conectado em A0 - ajuste conforme seu hardware
int readHC() {
  // Envia pulso ultrassônico
  digitalWrite(HC_TRIGGER_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(HC_TRIGGER_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(HC_TRIGGER_PIN, LOW);

  // Mede duração do pulso recebido no ECHO
  long duration = pulseIn(HC_ECHO_PIN, HIGH, 30000); // timeout 30ms

  if (duration == 0) {
    // Nenhum pulso recebido (fora do alcance)
    return -1;
  }

  // Calcula distância em centímetros
  // velocidade do som ~343 m/s = 0.0343 cm/us
  // distância = (tempo * velocidade) / 2 (ida e volta)
  int distance_cm = duration * 0.0343 / 2;

  return distance_cm;
}
