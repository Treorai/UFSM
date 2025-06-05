/*
| MPU-9250 | Arduino Mega 2560 |
| -------- | ----------------- |
| VCC      | 3.3V ou 5V        |
| GND      | GND               |
| SDA      | Pin 20 (SDA)      |
| SCL      | Pin 21 (SCL)      |

Monitor baudrate: 115200
*/

#include <Wire.h>

void setup() {
  Serial.begin(9600);
  Wire.begin();

  Serial.println("MPU9250 iniciado\n\n");
}

void loop() {
  // Download from gh

  //
  Wire.beginTransmission(0x68);
  Wire.write(0x3C);
  Wire.endTransmission(false);
  Wire.requestFrom(0x68, 1);

  if(Wire.available()==1){
    acelx_h = Wire.read();
  }

  acelx_final = (acelx_h << 16) + acelx_l;
  Serial.println("Acel X final ");
  Serial.print(acelx_final);
  

  delay(1000);
}