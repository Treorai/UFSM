#include <Keypad.h>

// Keypad size
const byte ROWS = 4;
const byte COLS = 3;

// Keymap
char keys[ROWS][COLS] = {
  {'1','2','3'},
  {'4','5','6'},
  {'7','8','9'},
  {'*','0','#'}
};

// Wiring to analog pins A0–A6
byte rowPins[ROWS] = {A8, A9, A10, A11}; // Rows
byte colPins[COLS] = {A12, A13, A14};     // Columns

// Keypad setup
Keypad keypad = Keypad(makeKeymap(keys), rowPins, colPins, ROWS, COLS);

// Setup function (runs once)
void setup() {
  Serial.begin(9600);
  Serial.println("3x4 Keypad on A0–A6 ready. Press a key:");
}

// Loop function (runs repeatedly)
void loop() {
  char key = keypad.getKey();

  if (key) {
    Serial.print("Key Pressed: ");
    Serial.println(key);
  }
}
