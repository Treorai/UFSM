const int buttonPin = 2;
const int ledPin = 13;

bool lastButtonState = HIGH;
bool ledState = false;
int pressCount = 0; // Contador de cliques

void setup() {
pinMode(buttonPin, INPUT_PULLUP);
pinMode(ledPin, OUTPUT);
digitalWrite(ledPin, LOW);

Serial.begin(9600); // Inicia a comunicação serial
Serial.println("Contador iniciado");
}

void loop() {
bool currentButtonState = digitalRead(buttonPin);

// Detecta clique (transição de HIGH para LOW)
if (lastButtonState == HIGH && currentButtonState == LOW) {
ledState = !ledState;
digitalWrite(ledPin, ledState ? HIGH : LOW);

pressCount++; // Incrementa o contador
Serial.print("Botão pressionado ");
Serial.print(pressCount);
Serial.println(" vez(es)");

delay(50); // Debounce simples
}

lastButtonState = currentButtonState;
}