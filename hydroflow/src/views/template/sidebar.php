<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="/assets/css/index.css" />
  <?php loadCss($nomeCss) ?>
  <link rel="stylesheet" href="/assets/css/menssagem.css" />
  <link rel="stylesheet" href="/assets/css/comum.css" />
  <link rel="stylesheet" href="/assets/css/fonts/style.css">
  <title>HydroFlow</title>
</head>

<body>
  <nav class="nav-bar">
    <input type="checkbox" class="nav-toggle" id="nav-toggle" />
    <div class="nav-header">
      <a href="#" class="nav-title">Hydr<i class="ph-bold ph-drop"></i>Flow</a>
      <label for="nav-toggle"><span class="nav-toggle-burger"></span></label>
      <hr />
    </div>
    <div class="nav-content">
      <div class="nav-button">
        <i class="icon ph-bold ph-chart-line"></i><span>Gráficos</span>
      </div>
      <div class="nav-button">
        <i class="icon ph-bold ph-faders"></i><a href="painel_controle.php">Painel de Controle</a>
      </div>
      <div class="nav-button">
        <i class="icon ph-bold ph-flag"></i><span>Zona</span>
      </div>
      <div class="nav-button">
        <i class="icon ph-bold ph-potted-plant"></i><a href="">Jardim</a>
      </div>
      <div class="nav-button">
        <i class="icon ph-bold ph-circuitry"></i><a href="registros_dispositivo.php">Dispositivos</a>
      </div>
      <div class="nav-content-highlight"></div>
    </div>
    <input type="checkbox" id="nav-footer-toggle" class="nav-footer-toggle" />
    <div class="nav-footer">
      <div class="nav-footer-heading">
        <div class="nav-footer-avatar">
          <img src="/assets/img/usuario-padrao.png" alt="" />
        </div>
        <div class="nav-footer-titlebox">
          <a href="" class="nav-footer-title">usuário</a>
          <span class="nav-footer-subtitle">Admin</span>
        </div>
        <label for="nav-footer-toggle"><i class="icon ph-bold ph-caret-up"></i></label>
      </div>
      <div class="nav-footer-content">
        <div class="btn-logout">
          <a href="logout.php"><i class="icon ph-bold ph-sign-out"></i>Sair</a>
        </div>
      </div>
    </div>
  </nav>