<?php

loadModel("Jardim");

$jardins = Jardim::getOne([],'max(id) + 1 as id');

if($_POST) {
    $jardim = [];
    $zona = [];
    for ($contador = 1; $contador <= $_POST['contador']; $contador++){

        foreach($_POST as $chave => $valor) {
            if(strpos("$chave", $contador)) {
                unset($_POST[$chave]);
                if(strpos("$chave", "nome_zona") !== false){
                    $zona['nome_zona'] .= $valor;
                } else {
                    $zona[substr($chave, 0, -1)] = $valor;
                }
            }
        }
        $zona['id_jardim'] = $jardins->id;
        print_r($zona);
        echo"<br>";
        unset($zona);
    }
    unset($_POST['contador']);
    print_r($_POST);
}