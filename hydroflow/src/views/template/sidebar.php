<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="shortcut icon" href="/assets/img/drop-bold.svg" type="image/x-icon">
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
      <a href="" class="nav-button">
        <i class="icon ph-bold ph-chart-line"></i><span>Gráficos</span>
      </a>
      <a href="registros_jardim.php" class="nav-button">
        <i class="icon ph-bold ph-potted-plant"></i><span>Jardim</span>
      </a>
      <a href="registros_dispositivo.php" class="nav-button">
        <i class="icon ph-bold ph-circuitry"></i><span>Dispositivos</span>
      </a>
      <a href="painel_controle.php" class="nav-button">
        <i class="icon ph-bold ph-faders"></i><span>Painel de Controle</span>
      </a>
      <a href="parametros.php" class="nav-button">
        <i class="icon ph-bold ph-faders-horizontal"></i><span>Parâmetros</span>
      </a>
      <div class="nav-content-highlight"></div>
    </div>
    <input type="checkbox" id="nav-footer-toggle" class="nav-footer-toggle" />
    <div class="nav-footer">
      <div class="nav-footer-heading">
        <div class="nav-footer-avatar">
          <img src="/assets/img/usuario-padrao.png" alt="" />
        </div>
        <div class="nav-footer-titlebox">
          <span class="nav-footer-title">usuário</span>
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