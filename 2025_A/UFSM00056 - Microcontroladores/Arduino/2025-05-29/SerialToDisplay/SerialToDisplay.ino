#include <LiquidCrystal.h>

const int rs = A3, en = A5, d4 = A9, d5 = A10, d6 = A11, d7 = A12;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

String textoRecebido = "";  // Variável para armazenar o texto digitado

void setup() {
  pinMode(A14, OUTPUT);
  pinMode(A13, OUTPUT);
  pinMode(A4, OUTPUT);
  pinMode(A0, OUTPUT);
  pinMode(A2, OUTPUT);
  pinMode(A1, OUTPUT);

  digitalWrite(A14, LOW);
  digitalWrite(A13, HIGH);
  digitalWrite(A4, LOW);
  digitalWrite(A0, LOW);
  digitalWrite(A2, LOW);
  digitalWrite(A1, HIGH);

  lcd.begin(16, 2);       // Inicializa o display 16x2
  Serial.begin(9600);     // Inicializa a comunicação serial
  Serial.println("Comunicação serial estabelecida");
}

void loop() {
  // Verifica se há dados disponíveis no monitor serial
  if (Serial.available()) {
    textoRecebido = Serial.readStringUntil('\n'); // Lê até pressionar Enter

    lcd.clear();  // Limpa o display
    lcd.setCursor(0, 0);
    lcd.print(textoRecebido.substring(0, 16)); // Mostra até 16 caracteres

    if (textoRecebido.length() > 16) {
      lcd.setCursor(0, 1);
      lcd.print(textoRecebido.substring(16, 32)); // Mostra até mais 16 na linha 2
    }
  }
}
