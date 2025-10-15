const express = require("express");
const bodyParser = require("body-parser");
const os = require("os");

const app = express();
const port = 3001;

app.use(bodyParser.json());

let tomadaLigada = true;
let ultimaTemperatura = null;
let ultimaUmidade = null;

app.post("/monitor", (req, res) => {
  const { temperature, humidity } = req.body;

  console.log(`Temperatura recebida: ${temperature} °C`);
  console.log(`Umidade recebida: ${humidity} %`);

  ultimaTemperatura = temperature;
  ultimaUmidade = humidity;

  if (temperature > 30) {
    tomadaLigada = false;
    console.log(">>> Temperatura alta! Desligando tomada.");
  } else {
    tomadaLigada = true;
    console.log(">>> Temperatura ok. Tomada ligada.");
  }

  res.json({ status: "OK", tomada: tomadaLigada });
});

app.get("/", (req, res) => {
  if (ultimaTemperatura === null || ultimaUmidade === null) {
    res.send("Não houveram leituras ainda.");
  } else {
    res.send(`Temperatura: ${ultimaTemperatura} °C<br>Umidade: ${ultimaUmidade} %`);
  }
});

app.listen(port, () => {
  const interfaces = os.networkInterfaces();
  console.log(`Servidor aberto na porta ${port}.`);
  console.log(`Obtendo informações de IP...`);

  for (const name of Object.keys(interfaces)) {
    for (const iface of interfaces[name]) {
      if (iface.family === "IPv4" && !iface.internal) {
        console.log(`Servidor online em: http://${iface.address}:${port}`);
      }
    }
  }
});
