<?php

class Dispositivo extends Model {
    protected static $tableName = "dispositivos";
    protected static $columns = [
        'id',
        'nome_dispostivo',
        'modelo_dispositivo',
        'descricao',
        'pino_arduino',
        'id_tipo_dispositivo',
        'id_zona'
    ];
}