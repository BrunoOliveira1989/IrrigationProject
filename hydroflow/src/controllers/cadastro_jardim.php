<?php
session_start();
requireValidSession();

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

loadTemplateView("cadastro_jardim", $_POST = [
    'nomeCss' => 'cadastro',
    'exception' => $exception
]);