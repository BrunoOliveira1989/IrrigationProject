<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/assets/css/login.css">
    <title>HydroFlow</title>
</head>
<body>
    <div class="login-container">
        <div class="login">
            <h1 class="nav-title">Hydr<i class="ph-bold ph-drop"></i>Flow</h1>
            <h2>Entrar</h2>
            <form action="#" method="post" class="form">
                <div class="form-group">
                    <input class="form-input" type="text" name="usuario" id="usuario" placeholder="Usuário">
                    <label class="form-label" for="usuario" value="<?= !empty($email) ? $email : '' ?>" autofocus>Usuário</label>
                </div>
                <div class="form-group">
                    <input class="form-input" type="password" name="senha" id="senha" placeholder="Senha">
                    <label class="form-label" for="senha">Senha</label>
                </div>
                <button class="btn-submit">Entrar</button>
            </form>
        </div>
    </div>
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
</body>
</html>