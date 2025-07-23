
#include <Keypad.h>// Certifique-se de incluir a biblioteca Keypad

// Configuração do teclado
const byte ROWS = 4;
const byte COLS = 3;
char keys[ROWS][COLS] = {
{'1', '2', '3'},
{'4', '5', '6'},
{'7', '8', '9'},
{'*', '0', '#'}
};
byte rowPins[ROWS] = {A8, A9, A10, A11}; // Linhas
byte colPins[COLS] = {A12, A13, A14}; // Colunas
Keypad keypad = Keypad(makeKeymap(keys), rowPins, colPins, ROWS, COLS);

// Variáveis
String num1 = "";
String num2 = "";
bool firstComplete = false;
bool secondComplete = false;

void setup() {
Serial.begin(9600);
Serial.println("Digite o primeiro número");
}

void loop() {
char key = keypad.getKey();

if (key) {
if (key >= '0' && key <= '9') {
if (!firstComplete) {
num1 += key;
Serial.print(key);
} else if (!secondComplete) {
num2 += key;
Serial.print(key);
}
} else if (key == '*') {
if (num1 != "") {
firstComplete = true;
Serial.println(" <- Primeiro número");
}
} else if (key == '#') {
if (num2 != "") {
secondComplete = true;
Serial.println(" <- Segundo número");

// Realiza a soma
int val1 = num1.toInt();
int val2 = num2.toInt();
int result = val1 + val2;

Serial.print("Soma: ");
Serial.println(result);

// Reset
num1 = "";
num2 = "";
firstComplete = false;
secondComplete = false;
Serial.println("\nDigite o primeiro número");
}
}
}
}