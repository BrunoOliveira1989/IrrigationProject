<?php

$data = file_get_contents('php://input');
$dados = json_decode($data, true);

$exception = null;
$response = [];
loadModel("Parametro");

if(count($dados) > 0) {
    try {
        $novoParametro = new Parametro($dados);
        $novoParametro->inserir();
        $response = ["success" => true];
    } catch(Exception $e) {
        $exception = $e;
        $response = ["success" => false, "erros" => $exception];
    }
    
    header('Content-Type: application/json');
    echo json_encode($response);
}