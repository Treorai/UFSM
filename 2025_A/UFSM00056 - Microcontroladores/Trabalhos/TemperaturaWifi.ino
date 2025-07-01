#include <WiFi.h>
#include <HTTPClient.h>
#include "DHTesp.h"

#define DHTPIN 14       // Pino do sensor DHT11
#define RELE_PIN 27     // Pino onde o relé está conectado

const char* ssid = "Ttmobilelan";         // Nome do Wi-Fi
const char* password = "00441122";        // Senha do Wi-Fi
const char* serverEndpoint = "http://192.168.23.59:3001/endpoint"; // IP do servidor Node.js

DHTesp dht;

void setup() {
  Serial.begin(115200);

  // Inicializar sensor DHT11
  dht.setup(DHTPIN, DHTesp::DHT11);

  // Inicializar pino do relé
  pinMode(RELE_PIN, OUTPUT);
  digitalWrite(RELE_PIN, HIGH);  // HIGH geralmente significa "desligado" para relés de baixa ativação

  // Conectar ao Wi-Fi
  WiFi.begin(ssid, password);
  Serial.print("Conectando-se ao Wi-Fi");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("\nConectado!");
  Serial.print("Endereço IP local: ");
  Serial.println(WiFi.localIP());
}

void loop() {
  TempAndHumidity data = dht.getTempAndHumidity();

  if (isnan(data.temperature) || isnan(data.humidity)) {
    Serial.println("Falha ao ler dados do DHT11.");
    return;
  }

  Serial.printf("Temperatura: %.2f °C\n", data.temperature);
  Serial.printf("Umidade: %.2f %%\n", data.humidity);

  sendToServer(data.temperature, data.humidity);

  delay(10000); // Aguarda 10 segundos antes de enviar novamente
}

void sendToServer(float temperature, float humidity) {
  if (WiFi.status() == WL_CONNECTED) {
    HTTPClient http;

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

    } else {
      Serial.print("Erro ao enviar dados: ");
      Serial.println(httpResponseCode);
    }

    http.end();
  } else {
    Serial.println("Não conectado ao Wi-Fi.");
  }
}
