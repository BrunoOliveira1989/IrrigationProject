<?php

loadModel("Paramestro");

$parametros = Parametros::getCheckboxesValues(['id_jardim' => $_GET['jardim'], 'id_area' => $_GET['area']]);

// header('Content-Type: application/json');

echo json_encode($parametros);
