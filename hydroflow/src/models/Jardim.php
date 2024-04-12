<?php

class Jardim extends Model {
    protected static $tableName = "jardins";
    protected static $columns = [
        'id',
        'nome_jardim',
        'cep',
        'logradouro',
        'numero',
        'bairro',
        'cidade',
        'estado',
        'tamanho',
        'descricao_jardim',
        'id_funcionario'
    ];

    public function inserir() {
        $this->validar();
        if(!$this->descricao_jardim) $this->descricao_jardim = null;
        if(!$this->id_funcionario) $this->id_funcionario = null;
        return parent::insert();
    }

    private function validar() {
        $errors = [];

        if(count($errors) > 0) {
            throw new ValidationException($errors);
        }
    }

    public static function getZonas($id) {
        return static::getCount(['raw' => "id = {$id}"]);
    }
}