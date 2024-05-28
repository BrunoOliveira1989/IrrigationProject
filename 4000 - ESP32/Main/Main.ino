#include <WiFi.h>               // Inclui a biblioteca para conexão WiFi
#include <PubSubClient.h>       // Inclui a biblioteca para comunicação MQTT
#include <TimeLib.h>            // Inclui a biblioteca para manipulação de tempo
#include <DHT.h>                // Inclui a biblioteca para o sensor DHT (umidade e temperatura)k
#include <ArduinoJson.h>        // Inclui a biblioteca para manipulação de JSON
#include "Structs.h"  // Incluir o arquivo de cabeçalho das structs
#include "Define.h"  // Incluir o arquivo de cabeçalho das structs

WiFiClient espClient;               // Cria um cliente WiFi
PubSubClient client(espClient);     // Cria um cliente MQTT

Parametro parametro;      // Instância da estrutura de parâmetros
Dispositivo dispositivo;  // Instância da estrutura de dispositivos
Comando comando;          // Instância da estrutura de comandos
Status status;            // Instância da estrutura de status
DHT dht(DHTPin, DHTTYPE);  // Cria um objeto para o sensor DHT

unsigned long lastSensorsSending = 0;  // Último envio de leituras dos sensores
unsigned long lastStatusSending = 0;    // Último envio do status do sistema
unsigned long lastSensorTimer = 1000;          // Último intervalo de envio de leituras dos sensores

unsigned long ultimo_tempo_flip = 0;
bool estado_flip = false;
const unsigned long tempo_ligado = 1000;  // Tempo ligado em milissegundos (ajustar conforme necessário)
const unsigned long tempo_desligado = 1000;  // Tempo desligado em milissegundos (ajustar conforme necessário)

void setup() {
  Serial.begin(115200);   // Inicia a comunicação serial com a velocidade de 115200 bps
  connectWiFi();          // Inicia a conexão WiFi
  setupMqtt();            //Configura MQTT
  controlar_valvula(false);                         // Desliga a valvula
  controlar_motor(false);                           // Desliga o motor

  pinMode(DHTPin, INPUT);   // Define o pino do sensor DHT como entrada
  dht.begin();              // Inicializa o sensor DHT
  pinMode(MotorPin, OUTPUT);
  pinMode(ValvulaPin, OUTPUT);
}

void loop() {
  if (!client.connected()) {
    reconnect();  // Reconecta ao servidor MQTT, se não estiver conectado
  }
  client.loop();  // Mantém a conexão MQTT ativa

  // Realiza leituras dos sensores
  /*dispositivo.temperatura = dht.readTemperature();
  dispositivo.umidade_ar = dht.readHumidity();
  dispositivo.umidade_solo = map(analogRead(SensorUmidadePin), 0, 4095, 0, 100);*/
  /*dispositivo.consumo_agua = 0;*/

  dispositivo.temperatura = 10.55;
  dispositivo.umidade_ar = 20.99;
  dispositivo.umidade_solo = 40.77;
  dispositivo.consumo_agua = 18.48;
  dispositivo.vazao = 111.00;

  // Envia leituras dos sensores para a nuvem periodicamente
  if (millis() - lastSensorsSending > lastSensorTimer) {
    sensors();
    lastSensorsSending = millis();
  }

  // Envia o status do sistema para a nuvem periodicamente
  if (millis() - lastStatusSending > 60000) {
    comand_status();
    lastStatusSending = millis();
  }
  
  if (comando.automatico) {
    //Automático
    // Verifica se as condições ideais foram atendidas e controla a irrigação
    bool return_condicoes = controlar_irrigacao();
    controlar_valvula(return_condicoes);  // Liga a valvula
    controlar_motor(return_condicoes);  // Liga o motor
  } else {
    //Manual
    controlar_valvula(comando.valvula);  // Liga a valvula
    controlar_motor(comando.motor);  // desliga a valvula
  }  
}

// Função para verificar se a hora atual está dentro do intervalo ideal
bool hora_ideal() {
  int hora_atual = hour();  // Obtém a hora atual
  return hora_atual > 6 && hora_atual < 20;
}

// Função para verificar se a temperatura está dentro dos limites ideais
bool temperatura_ideal() {
  return dispositivo.temperatura >= parametro.limite_iniciar_temperatura && dispositivo.temperatura <= parametro.limite_parar_temperatura;
}

// Função para verificar se a umidade do solo está dentro dos limites ideais
bool umidade_solo_ideal() {
  return dispositivo.umidade_solo <= parametro.limite_iniciar_umidade;
}

// Função para verificar se o consumo de água está dentro do limite ideal
bool consumo_ideal() {
  return dispositivo.consumo_agua <= parametro.limite_maximo_consumo;
}

// Função para alternar o estado com tempos específicos de ligado e desligado
bool flip(unsigned long tempo_ligado, unsigned long tempo_desligado) {
  unsigned long tempo_atual = millis();
  if (estado_flip && (tempo_atual - ultimo_tempo_flip >= tempo_ligado)) {
    estado_flip = false;
    ultimo_tempo_flip = tempo_atual;
  } else if (!estado_flip && (tempo_atual - ultimo_tempo_flip >= tempo_desligado)) {
    estado_flip = true;
    ultimo_tempo_flip = tempo_atual;
  }
  return estado_flip;
}

bool controlar_irrigacao() {
  bool hora = hora_ideal();
  bool temperatura;
  bool umidade;
  bool consumo;

  if (comando.controle_temperatura) {
    temperatura = temperatura_ideal();
  } else {
    temperatura = 1;
  }

  if (comando.controle_umidade) {
    umidade = umidade_solo_ideal();
  } else {
    umidade = 1;
  }

  if (comando.controle_consumo) { 
    consumo = consumo_ideal();
  } else {
    consumo = 1;
  }
  if (comando.controle_umidade) {
    return  hora && umidade && temperatura && consumo;
  } else if (comando.controle_temperatura || comando.controle_consumo) {
    bool irrigacao_intermitente = flip(tempo_ligado, tempo_desligado);
    return hora && umidade && temperatura && consumo && irrigacao_intermitente;  
  } else {
  return false;
  }
}

/*
// Função para verificar as condições ideais para irrigação
bool controlar_irrigacao() {
  int hora_atual = hour();  // Obtém a hora atual
  // Verifica se está dentro do intervalo de horário para irrigação
  bool hora_ideal = hora_atual > 6 && hora_atual < 20;

  // Verifica se a temperatura está dentro dos limites ideais
  bool temperatura_ideal = dispositivo.temperatura >= parametro.limite_iniciar_temperatura && dispositivo.temperatura <= parametro.limite_parar_temperatura;
  
  // Verifica se a umidade do ar está dentro dos limites ideais  
  bool umidade_ar_ideal = 1;  // Supondo que a umidade do ar sempre esteja ideal (pode ser ajustado conforme necessário)

  // Verifica se a umidade do solo está dentro dos limites ideais
  bool umidade_solo_ideal;
  if (dispositivo.umidade_solo <= parametro.limite_iniciar_umidade){
    umidade_solo_ideal = 1;  // Solo está úmido, ideal para irrigação
  }
  if (dispositivo.umidade_solo >= parametro.limite_parar_umidade){
    umidade_solo_ideal = 0;  // Solo está seco, não é necessário irrigar
  }

  // Retorna verdadeiro se todas as condições ideais forem atendidas
  return hora_ideal && temperatura_ideal && umidade_ar_ideal && umidade_solo_ideal;
}*/

// Função para controlar a válvula
void controlar_valvula(bool ligada) {
  // Define o estado da válvula com base no parâmetro 'ligada'
  digitalWrite(ValvulaPin, ligada ? LOW : HIGH);
  // Atualiza o estado da válvula na estrutura 'dispositivo'
  dispositivo.valvula = ligada ? (10 + comando.automatico) : 0;
}

// Função para controlar o motor
void controlar_motor(bool ligado) {
  // Define o estado do motor com base no parâmetro 'ligado'
  digitalWrite(MotorPin, ligado ? LOW : HIGH);
  // Atualiza o estado do motor na estrutura 'dispositivo'
  dispositivo.motor = ligado ? (10 + comando.automatico) : 0;
}