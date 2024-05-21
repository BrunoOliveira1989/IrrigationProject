#ifndef STRUCTS_H
#define STRUCTS_H

// Estruturas de dados
struct Parametro {
  int dias_semana;
  float limite_iniciar_umidade;
  float limite_parar_umidade;
  float limite_iniciar_temperatura;
  float limite_parar_temperatura;
  float limite_minimo_consumo;
  float limite_maximo_consumo;
};

struct Dispositivo {
  float temperatura;
  float umidade_ar;
  float umidade_solo;
  float vazao;
  float consumo_agua;
  int valvula;
  int motor;
};

struct Comando {
  bool automatico;
  bool valvula;
  bool motor;
  bool controle_temperatura;
  bool controle_umidade;
  bool controle_consumo;
};

struct Status {
  bool automatico;
  bool valvula;
  bool motor;
  bool controle_temperatura;
  bool controle_umidade;
  bool controle_consumo;
};

#endif
