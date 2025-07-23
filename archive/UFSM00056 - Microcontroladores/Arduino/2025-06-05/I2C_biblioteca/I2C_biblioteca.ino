/*
| MPU-9250 | Arduino Mega 2560 |
| -------- | ----------------- |
| VCC      | 3.3V ou 5V        |
| GND      | GND               |
| SDA      | Pin 20 (SDA)      |
| SCL      | Pin 21 (SCL)      |

Monitor baudrate: 115200
*/
 
#include <MPU9250_asukiaaa.h> 
#include <Wire.h>

MPU9250_asukiaaa mySensor;

void setup() {
  Serial.begin(9600);
  Wire.begin(); // Inicia I2C nos pinos 20 (SDA) e 21 (SCL) do Mega
  mySensor.setWire(&Wire);
  mySensor.beginAccel();
  mySensor.beginGyro();
  mySensor.beginMag();

  Serial.println("MPU9250 iniciado\n\n");
}

void loop() {
  mySensor.accelUpdate();
  mySensor.gyroUpdate();
  mySensor.magUpdate();

  Serial.print("Accel (g): ");
  Serial.print(mySensor.accelX(), 2); Serial.print(", ");
  Serial.print(mySensor.accelY(), 2); Serial.print(", ");
  Serial.println(mySensor.accelZ(), 2);

  Serial.print("Gyro (°/s): ");
  Serial.print(mySensor.gyroX(), 2); Serial.print(", ");
  Serial.print(mySensor.gyroY(), 2); Serial.print(", ");
  Serial.println(mySensor.gyroZ(), 2);

  Serial.print("Mag (uT): ");
  Serial.print(mySensor.magX(), 2); Serial.print(", ");
  Serial.print(mySensor.magY(), 2); Serial.print(", ");
  Serial.println(mySensor.magZ(), 2);
  Serial.println("==============================");
  delay(1000);

}