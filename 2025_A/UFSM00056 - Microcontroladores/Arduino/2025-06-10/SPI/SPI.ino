#include <SPI.h>

#define MPU_CS_PIN 10  // Chip Select pin
#define MPU_ADDR       0x68 // reg periferico
#define ACCEL_XOUT_H   0x3B // byte alto do x out

// SPI settings
SPISettings mpuSettings(1000000, MSBFIRST, SPI_MODE3); // 1MHz, MSB first, Mode 3

void setup() {
  Serial.begin(115200); 
  
  // Initialize SPI
  pinMode(MPU_CS_PIN, OUTPUT);
  digitalWrite(MPU_CS_PIN, HIGH); // Deselect MPU initially
  SPI.begin();
  
  delay(100); // Allow MPU to stabilize
}

void loop() {
  // Read accelerometer X-axis (ACCEL_XOUT_H and ACCEL_XOUT_L)
  int16_t accelX = readRegisterSPI(ACCEL_XOUT_H);
  
  // Convert to Gs (assuming ±2g range)
  float accelX_g = accelX; // / 16384.0;
  
  Serial.print("X Acceleration: ");
  Serial.print(accelX_g);
  Serial.println("\n");
  
  delay(100); // Read at 10Hz
}

int16_t readRegisterSPI(uint8_t reg) {
  uint8_t addr = reg | 0x80; // Set MSB for read operation
  
  digitalWrite(MPU_CS_PIN, LOW); // Select MPU
  SPI.beginTransaction(mpuSettings);
  
  // Send address with read bit set
  SPI.transfer(addr);
  // Read high byte
  uint8_t highByte = SPI.transfer(0x00);
  // Read low byte
  //uint8_t lowByte = SPI.transfer(0x00);
  
  SPI.endTransaction();
  digitalWrite(MPU_CS_PIN, HIGH); // Deselect MPU
  
  return (int16_t)highByte;
  //return (int16_t)((highByte << 8) | lowByte);
}