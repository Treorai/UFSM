/* 
** Um sistema possui 3 sensores A, B, C
** A vai de 100 a 500
** B vai de -50 a -1
** C vai de 5800 a 25000
** 
** O sistema pode acionar um aquecedor e um refrigerador
** Controle o sistema com a seguinte lógica:
** 
** Se A > 300 e B < -20 então ligar aquecedor
** Se C > 15000 ou (A < 200 e B > -10) então ligar refrigerador
** else desliga tudo
**/

const int aSensorPin = A0;
const int bSensorPin = A1;
const int cSensorPin = A2;

const int heaterPin = 53;
const int freezerPin = 51;

// Faixas dos sensores reais
const int aMin = 100;
const int aMax = 500;

const int bMin = -50;
const int bMax = -1;

const int cMin = 5800;
const int cMax = 25000;

int aRaw = 0;
int bRaw = 0;
int cRaw = 0;

int aSensorValue = 0; // 100 a 500
int bSensorValue = 0; // -50 a -1
int cSensorValue = 0; // 5800 a 25000

bool heaterON = false;
bool freezerON = false;

void setup() {
  Serial.begin(9600);
  pinMode(heaterPin, OUTPUT);
  pinMode(freezerPin, OUTPUT);
}

void loop() {
  // Leitura analógica crua dos sensores (0–1023)
  aRaw = analogRead(aSensorPin);
  bRaw = analogRead(bSensorPin);
  cRaw = analogRead(cSensorPin);

  // Mapeando os valores para o intervalo real dos sensores
  aSensorValue = map(aRaw, 0, 1023, aMin, aMax);     // 100 a 500
  bSensorValue = map(bRaw, 0, 1023, bMin, bMax);     // -50 a -1
  cSensorValue = map(cRaw, 0, 1023, cMin, cMax);     // 5800 a 25000

  // Reset dos estados
  heaterON = false;
  freezerON = false;

  // Lógica de controle
  if (aSensorValue > 300 && bSensorValue < -20) {
    heaterON = true;
  }

  if (cSensorValue > 15000 || (aSensorValue < 200 && bSensorValue > -10)) {
    freezerON = true;
  }

  // Controle dos dispositivos
  digitalWrite(heaterPin, heaterON ? HIGH : LOW);
  digitalWrite(freezerPin, freezerON ? HIGH : LOW);

  // Envio para o Serial Plotter ou Monitor
  Serial.print("A:"); Serial.print(aSensorValue);
  Serial.print("\tB:"); Serial.print(bSensorValue);
  Serial.print("\tC:"); Serial.print(cSensorValue);
  Serial.print("\tHeater:"); Serial.print(heaterON ? "1" : "0");
  Serial.print("\tFreezer:"); Serial.println(freezerON ? "1" : "0");

  delay(1000);
}