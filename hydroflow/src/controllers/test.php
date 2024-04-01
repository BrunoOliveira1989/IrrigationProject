<?php

$array = [
    'nome_jardim' => 'Parque Juca Mulato',
    'descricao1' => 'Parque Linear'
];

foreach($array as $key => $value) {
    if(strpos($key, '1') !== false) {
        echo $value;
        die ();
    }
    echo $value;
}