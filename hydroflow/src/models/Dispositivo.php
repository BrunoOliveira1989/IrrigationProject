<?php

class Dispositivo extends Model {
    protected static $tableName = "dispositivos";
    protected static $columns = [
        'id',
        'nome_dispositivo',
        'modelo_dispositivo',
        'descricao',
        'pino_arduino',
        'id_tipo_dispositivo',
        'id_zona'
    ];

    public function inserir() {
        $this->validar();
        if(!$this->descricao) $this->descricao = null;
        return parent::insert();
    }

    private function validar() {
        $errors = [];

        if(!$this->nome_dispositivo) {
            $errors['nome_dispositivo'] = 'Nome é um campo obrigatório';
        }

        if(!$this->modelo_dispositivo) {
            $errors['modelo_dispositivo'] = 'Modelo é um campo obrigatório';
        }

        if(!$this->id_tipo_dispositivo) {
            $errors['tipo_dispositivo'] = 'Tipo é um campo obrigatório';
        }

        if(!$this->id_zona) {
            $errors['zona'] = 'Zona é um campo obrigatório';
            $errors['jardim'] = 'Jardim é um campo obrigatório';
        }

        if(count($errors) > 0) {
            throw new ValidationException($errors);
        }
    }
}