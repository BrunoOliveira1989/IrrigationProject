<main class="main">
    <?php
        renderTitle(
            "Dispositivos",
            "preencha os campos com as informções do dispositivo",
            "circuitry"
        );

        include(TEMPLATE_PATH . "/messages.php");
    ?>
    <div class="content">
        <form action="#" method="post"class="register" id="register">
            <div class="form-group">
                <div class="input-field flex-10">
                    <label for="jardim">Jardim</label>
                    <select class="input <?= $errors['jardim'] ? 'invalid' : '' ?>" name="jardim" id="id_jardim" class="input">
                        <option value="" selected>Selecione um Jardim...</option>
                        <?php foreach($jardins as $jardim) : ?>
                            <option value="<?= $jardim->id ?>"><?= $jardim->nome_jardim ?></option>
                        <?php endforeach ?>
                    </select>
                    <div class="invalid-feedback"><?= $errors['jardim'] ?></div>
                </div>
                <div class="input-field">
                    <label for="id_zona">Zona</label>
                    <select class="input  <?= $errors['zona'] ? 'invalid' : '' ?>" name="id_zona" id="id_area">
                        <option value="" id="zona" selected>Selecione uma Zona...</option>
                    </select>
                    <div class="invalid-feedback"><?= $errors['zona'] ?></div>
                </div>
            </div>
            <div class="form-group">
                <div class="input-field">
                    <label for="id_tipo_dispositivo">Tipo de Dispositivo</label>
                    <select class="input <?= $errors['tipo_dispositivo'] ? 'invalid' : '' ?>" name="id_tipo_dispositivo" id="id_tipo_dispositivo">
                        <option value="" selected>Selecione um tipo...</option>
                        <?php foreach($tipoDispositivos as $tipoDispositivo) : ?>
                            <option value="<?= $tipoDispositivo->id ?>"><?= $tipoDispositivo->nome_tipo_dispositivo ?></option>
                        <?php endforeach ?>
                    </select>
                    <div class="invalid-feedback"><?= $errors['tipo_dispositivo'] ?></div>
                </div>
                <div class="input-field">
                    <label for="nome_dispositivo">Nome do Dispositivo</label>
                    <input class="input  <?= $errors['nome_dispositivo'] ? 'invalid' : '' ?>" type="text" name="nome_dispositivo" id="nome_dispositivo" />
                    <div class="invalid-feedback"><?= $errors['nome_dispositivo'] ?></div>
                </div>
                <div class="input-field">
                    <label for="modelo_dispositivo">Modelo do Dispositivo</label>
                    <input class="input  <?= $errors['modelo_dispositivo'] ? 'invalid' : '' ?>" type="text" name="modelo_dispositivo" id="modelo_dispositivo" />
                    <div class="invalid-feedback"><?= $errors['modelo_dispositivo'] ?></div>
                </div>
            </div>
            <div class="form-group">
                <div class="input-field">
                    <label for="descricao">Descrição</label>
                    <textarea class="input textarea" name="descricao" id="descricao" cols="30" rows="10"></textarea>
                </div>
            </div>
            <div class="btn-box">
                <button type="submit" form="register" class="btn-register">
                    <i class="ph-bold ph-check-fat"></i>Cadastrar
                </button>
                <a href="registros_dispositivo.php" class="btn-register cancel">
                    <i class="ph-bold ph-x"></i>Cancelar
                </a>
            </div>
        </form>
    </div>
</main>