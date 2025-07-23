char input;

void setup(){
  Serial.begin(9600);
  Serial2.begin(9600);
  Serial.println("ok");
}


void loop(){
  if (Serial.available()>0) {
    input = (char)Serial.read();
    Serial1.write(input);
  }
}


/*
void loop(){
  if (Serial1.available()>0) {
    input = (char)Serial1.read();
    Serial.print(input);
  }
}
*/
