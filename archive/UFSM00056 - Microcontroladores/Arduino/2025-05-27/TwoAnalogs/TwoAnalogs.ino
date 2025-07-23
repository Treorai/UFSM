const int analogInPin = A0;  // Analog input pin that the potentiometer is attached to
const int analogOutPin = 13;  // Analog output pin that the LED is attached to

const int analogInPin1 = A1;

int sensorValue = 0;  // value read from the pot
int outputValue = 0;  // value output to the PWM (analog out)
int sensorValue1 = 0;
int outputValue1 = 0;

int out = 0;

void setup() {
  // initialize serial communications at 9600 bps:
  Serial.begin(9600);
}

void loop() {
  // read the analog in value:
  sensorValue = analogRead(analogInPin);
  sensorValue1 = analogRead(analogInPin1);
  // map it to the range of the analog out:
  outputValue = map(sensorValue, 0, 1023, 0, 255);
  outputValue1 = map(sensorValue1, 0, 1023, 0, 255);
  // change the analog out value:

  out = (outputValue + outputValue1)/2;
  Serial.println(out);
  Serial.print(outputValue1);
  Serial.print(outputValue);

  analogWrite(analogOutPin, out);

  delay(out);
}
