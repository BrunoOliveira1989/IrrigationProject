<?php
session_start();
requireValidSession();

loadModel("Dispositivo");

$dispositivos = Dispositivo::get();

loadTemplateView("registros_dispositivo", ['nomeCss' => 'registro', 'dispositivos' => $dispositivos]);