#include <LiquidCrystal.h>

const int rs = A3, en = A5, d4 = A9, d5 = A10, d6 = A11, d7 = A12;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

String textoRecebido = "";  // Armazena o texto digitado

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

  lcd.begin(16, 2);
  Serial.begin(9600);
  Serial.println("Digite letras. '*' limpa.");
}

void loop() {
  if (Serial.available()) {
    char caractere = Serial.read();

    // Ignora caracteres de controle como \r e \n
    if (caractere == '\n' || caractere == '\r') {
      return;
    }

    if (caractere == '*') {
      textoRecebido = "";
      lcd.clear();
      Serial.println("Texto apagado.");
    } else {
      textoRecebido += caractere;

      // Atualiza o LCD
      lcd.clear();
      lcd.setCursor(0, 0);
      lcd.print(textoRecebido.substring(0, 16));

      if (textoRecebido.length() > 16) {
        lcd.setCursor(0, 1);
        lcd.print(textoRecebido.substring(16, 32));
      }

      // Limita o tamanho do buffer a 32 caracteres
      if (textoRecebido.length() > 32) {
        textoRecebido = textoRecebido.substring(textoRecebido.length() - 32);
      }
    }
  }
}
