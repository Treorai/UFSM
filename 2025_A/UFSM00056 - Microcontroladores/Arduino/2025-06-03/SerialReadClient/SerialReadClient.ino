char input;

void setup(){
  Serial.begin(9600);
  Serial2.begin(9600);
}

/*
void loop(){
  if (Serial.available()>0) {
    input = (char)Serial.read();
    Serial1.print(input);
  }
}
*/


void loop(){
  if (Serial1.available()) {
    input = (char)Serial1.read();
    Serial.write(input);
  }
}

