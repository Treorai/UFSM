#include <WiFi.h>
#include <HTTPClient.h>
#include "DHTesp.h"

#define DHTPIN 14
#define RELE_PIN 13

const char* ssid = "Ttmobilelan";
const char* password = "00441122";
const char* serverEndpoint = "http://192.168.23.59:3001/monitor";

DHTesp dht;

void setup() {
  Serial.begin(115200);

  // Inicializar sensor DHT11
  dht.setup(DHTPIN, DHTesp::DHT11);

  // Inicializar pino do rele
  pinMode(RELE_PIN, OUTPUT);
  digitalWrite(RELE_PIN, HIGH); // rele desligado

  // Conectar ao wifi
  WiFi.begin(ssid, password);
  Serial.print("Conectando-se ao wi-fi");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("\nConectado.");
  Serial.print("Endereço IP local: ");
  Serial.println(WiFi.localIP());
}

void loop() {
  // carregar dados do sensor para o programa
  TempAndHumidity data = dht.getTempAndHumidity();

  if (isnan(data.temperature) || isnan(data.humidity)) {
    Serial.println("Falha ao ler dados do DHT11.");
    return;
  }

  // print data
  Serial.printf("Temperatura: %.2f °C\n", data.temperature);
  Serial.printf("Umidade: %.2f %%\n", data.humidity);

  // enviar ao servidor
  sendToServer(data.temperature, data.humidity);

  delay(1000); // Aguarda 10 segundos antes de enviar novamente
}

void sendToServer(float temperature, float humidity) {
  if (WiFi.status() == WL_CONNECTED) {
    HTTPClient http;

    // montar o json
    String jsonData = "{";
    jsonData += "\"temperature\": " + String(temperature, 2) + ",";
    jsonData += "\"humidity\": " + String(humidity, 2);
    jsonData += "}";

    http.begin(serverEndpoint);
    http.addHeader("Content-Type", "application/json");

    int httpResponseCode = http.POST(jsonData);

    if (httpResponseCode > 0) {
      String response = http.getString();
      Serial.println("Resposta do servidor:");
      Serial.println(response);

      // Verifica o valor do campo "tomada"
      if (response.indexOf("\"tomada\":false") >= 0) {
        digitalWrite(RELE_PIN, LOW); // Liga o relé (desliga a tomada)
        Serial.println(">>> Tomada DESLIGADA pelo servidor.");
      } else if (response.indexOf("\"tomada\":true") >= 0) {
        digitalWrite(RELE_PIN, HIGH); // Desliga o relé (liga a tomada)
        Serial.println(">>> Tomada LIGADA pelo servidor.");
      } else {
        Serial.println(">>> Resposta sem campo 'tomada' válido.");
      }

      if (digitalRead(RELE_PIN) == HIGH) {
        Serial.println("Relé está DESLIGADO (HIGH)");
      } else {
        Serial.println("Relé está LIGADO (LOW)");
      }

    } else {
      Serial.print("Erro ao enviar dados: ");
      Serial.println(httpResponseCode);
    }

    http.end();
  } else {
    Serial.println("Não conectado ao Wi-Fi.");
  }
}
