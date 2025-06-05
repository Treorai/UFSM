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
char input;
uint8_t acelx_l; // unsigned 8bits
uint8_t acely_h;
uint16_t acelx_final;

void setup() {
  Serial.begin(9600);
  Wire.begin();

  Serial.println("MPU9250 iniciado\n\n");
}

void loop() {
  // Leitura Hi
  Wire.beginTransmission(0x68);
  Wire.write(0x3B); //ACEL XOUT HI
  Wire.endTransmission(false); // SET BIT TO LO (READ) -- (HI = WRITE)
  Wire.requestFrom(0x68, 1);

  if(Wire.available()==1){
    acelx_h = Wire.read();
  }

  // Leitura Lo
  Wire.beginTransmission(0x68);
  Wire.write(0x3C); //ACEL XOUT HI
  Wire.endTransmission(false); // SET BIT TO LO (READ) -- (HI = WRITE)
  Wire.requestFrom(0x68, 1);

  if(Wire.available()==1){
    acelx_l = Wire.read();
  }

  acelx_final = (acelx_h << 8) + acelx_l;
  Serial.println("Acel X final ");
  Serial.print(acelx_final);

  delay(1000);
}
