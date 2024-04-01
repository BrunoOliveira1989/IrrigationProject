<?php
session_start();
requireValidSession();

loadTemplateView("painel_controle", ['nomeCss' => 'controle']);