<?php
session_start();
requireValidSession();

loadModel("Dispositivo");

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
$zonas = Dispositivo::getFromOtherTable("Zonas");
// $jardim = Dispositivo::consultaComInner("jardins",[],'j.id, j.nome_jardim, z.id, z.nome_zona', 'j INNER JOIN Zonas z ON j.id = z.id_jardim', 'j.id');

loadTemplateView("cadastro_dispositivo", $_POST = [
    'nomeCss' => 'cadastro',
    'exception' => $exception,
    'tipoDispositivos' => $tipoDispositivos,
    'zonas' => $zonas
]);