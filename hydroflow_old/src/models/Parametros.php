<?php

class Parametros extends Model {

    protected static $tableName = "parametrosirrigacoes";
    protected static $columns = [
        'id',
        'hora_inicio',
        'duracao',
        'dias_semana',
        'set_point_umidade',
        'max_umidade',
        'min_umidade',
        'max_temperatura',
        'min_temperatura',
        'id_tipo_planta',
        'id_tipo_irrigacao'
    ];
}