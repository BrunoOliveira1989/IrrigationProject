<main class="main">
    <?php
        renderTitle(
            "Dispositivos",
            "preencha os campos com as informções do dispositivo",
            "circuitry"
        );

        include(TEMPLATE_PATH . "/messages.php")
    ?>
    <div class="content">
        <form action="#" method="post"class="register" id="register">
            <div class="form-group">
                <div class="input-field">
                    <label for="jardim">Jardim</label>
                    <select class="input" name="jardim" id="jardim" class="input">
                        <option value="" selected>Selecione um Jardim...</option>
                        <?php foreach($jardins as $jardim) : ?>
                            <option value="<?= $jardim->id ?>"><?= $jardim->nome_jardim ?></option>
                        <?php endforeach ?>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="input-field">
                    <label for="id_zona">Zona</label>
                    <select class="input" name="id_zona" id="id_zona">
                        <option value="" id="zona" selected>Selecione uma Zona...</option>
                    </select>
                </div>
                <div class="input-field">
                    <label for="id_tipo_dispositivo">Tipo de Dispositivo</label>
                    <select class="input" name="id_tipo_dispositivo" id="id_tipo_dispositivo">
                        <?php foreach($tipoDispositivos as $tipoDispositivo) : ?>
                            <option value="<?= $tipoDispositivo->id ?>"><?= $tipoDispositivo->nome_tipo_dispositivo ?></option>
                        <?php endforeach ?>
                    </select>
                </div>
                <div class="input-field">
                    <label for="nome_dispositivo">Nome do Dispositivo</label>
                    <input class="input" type="text" name="nome_dispositivo" id="nome_dispositivo" />
                </div>
            </div>
            <div class="form-group">
                <div class="input-field">
                    <label for="modelo_dispositivo">Modelo do Dispositivo</label>
                    <input class="input" type="text" name="modelo_dispositivo" id="modelo_dispositivo" />
                </div>
                <div class="input-field">
                    <label for="pino_arduino">Pinos do Arduino</label>
                    <select class="input" name="pino_arduino" id="pino_arduino">
                        <option value="3" selected>3</option>
                        <option value="4">4</option>
                    </select>
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