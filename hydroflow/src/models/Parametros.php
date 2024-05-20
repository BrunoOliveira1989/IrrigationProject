<?php

class Parametros extends Model {

    protected static $tableName = "parametrosirrigacoes";
    protected static $columns = [
        'id_parametro',
        'hora_inicio',
        'duracao',
        'dias_semana',
        'set_point_umidade',
        'max_umidade',
        'min_umidade',
        'max_temperatura',
        'min_temperatura',
        'max_volume',
        'min_volume',
        'domingo',
        'segunda',
        'terca',
        'quarta',
        'quinta',
        'sexta',
        'sabado',
    ];

    public function inserir() {
        $this->validar();
        return parent::insert();
    }

    public function alterar() {
        $this->validar();
        return parent::update();
    }

    private function validar() {
        $errors = [];

        if(!$this->jardim) {
            $errors['jardim'] = 'Selecionar o Jardim é obrigatório';
        }

        if(!$this->id_zona) {
            $errors['id_zona'] = 'Selecionar uma Área é obrigatório';
        }

        if(!$this->hora_inicio) {
            $errors['hora_inicio'] = 'Hora de início é um campo obrigatório';
        }

        if(!$this->duracao) {
            $errors['duracao'] = 'Duração é um campo obrigatório';
        }

        if(!$this->max_umidade) {
            $errors['max_umidade'] = 'Úmidade máxima é um campo obrigatório';
        }
        
        if(!$this->min_umidade) {
            $errors['min_umidade'] = 'Úmidade mínima é um campo obrigatório';
        }

        if(!$this->max_temperatura) {
            $errors['max_temperatura'] = 'Temperatura máxima é um campo obrigatório';
        }

        if(!$this->min_temperatura) {
            $errors['min_temperatura'] = 'Temperatura mínima é um campo obrigatório';
        }

        if(!$this->max_volume) {
            $errors['max_volume'] = 'Volume máxima é um campo obrigatório';
        }

        if(!$this->min_volume) {
            $errors['min_volume'] = 'Volume mínima é um campo obrigatório';
        }

        if(!$this->segunda && !$this->terca && !$this->quarta && !$this->quinta && !$this->sexta && !$this->sabado && !$this->domingo) {
            $errors['dias'] = 'Obrigatório selecionar ao menos um dia';
        }

        if(count($errors) > 0) {
            throw new ValidationException($errors);
        }
    }
}