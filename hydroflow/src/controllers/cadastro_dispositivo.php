<?php
session_start();
requireValidSession();

loadModel("Dispositivo");
loadModel("Jardim");

$exception = null;

if(count($_POST) > 0) {
    try {
        $novoDispositivo = new Dispositivo($_POST);
        $novoDispositivo->inserir();
        addMsgSucesso("Dispositivo cadastrado com sucesso");
        $_POST = [];
    } catch(Exception $e) {
        $exception = $e;
    }
}

$tipoDispositivos = Dispositivo::getFromOtherTable("TiposDispositivos");
$jardins = Jardim::get([], 'id, nome_jardim');

loadTemplateView("cadastro_dispositivo", $_POST = [
    'nomeCss' => 'cadastro',
    'exception' => $exception,
    'tipoDispositivos' => $tipoDispositivos,
    'jardins' => $jardins
]);