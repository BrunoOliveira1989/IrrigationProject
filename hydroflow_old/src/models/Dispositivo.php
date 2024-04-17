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

        if(count($errors) > 0) {
            throw new ValidationException($errors);
        }
    }
}