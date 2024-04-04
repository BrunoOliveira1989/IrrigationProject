<?php

loadModel("Zona");

$zonas = Zona::get(['id_jardim' => $_GET['id']], 'id, nome_zona');

$html = "<option value='' selected>Selecione uma Zona...</option>";

foreach($zonas as $zona){
    $html .= "<option value='{$zona->id}'>{$zona->nome_zona}</option>";
}

echo $html;