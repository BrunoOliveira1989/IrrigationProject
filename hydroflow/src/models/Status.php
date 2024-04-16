<?php

class Status extends Model {

    protected static $tableName = "status_sistema";
    protected static $columns = [
        'id',
        'automatico',
        'valvula',
        'motor',
        'controle_temperatura',
        'controle_umidade',
        'controle_consumo',
        'id_jardim',
        'id_area'
    ];

    public static function getCheckboxesValues($filters = [], $columns = '*') {
        $result = static::getResultSetFromSelect($filters);
        return $result ? $result->fetch_assoc() : null;
    }
}