unsigned long previousMillis = 0;
int ledState;

void setup() {
  pinMode(13, 1);
}

void loop() {
  for(int i=0; i<5; i++){
    ledState = !ledState;
    delay(100);
    digitalWrite(13, ledState);
    };
    delay(1000);
    digitalWrite(13, ledState);
}
