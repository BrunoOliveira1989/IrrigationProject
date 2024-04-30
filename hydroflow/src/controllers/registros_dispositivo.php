<?php
session_start();
requireValidSession();

loadModel("Dispositivo");
loadModel("Zona");
loadModel("Jardim");

if($_GET['filtro']) {
    $ordem = $_GET['ordem'] ? $_GET['ordem'] : '';
    $dispositivos = Dispositivo::getOrderBy([], '*', "{$_GET['filtro']} {$ordem}");
} else {
    $dispositivos = Dispositivo::get();
}

$jardins = Jardim::get([], 'id, nome_jardim');
$zonas = Zona::get([], 'id, nome_zona, id_jardim');

loadTemplateView("registros_dispositivo", [
    'nomeCss' => 'registro',
    'dispositivos' => $dispositivos,
    'jardins' => $jardins,
    'zonas' => $zonas
]);