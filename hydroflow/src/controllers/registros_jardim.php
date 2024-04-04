<?php
session_start();
requireValidSession();

loadModel("Jardim");

$jardins = Jardim::get();

loadTemplateView("registros_jardim", ['nomeCss' => 'registro', 'jardins' => $jardins]);