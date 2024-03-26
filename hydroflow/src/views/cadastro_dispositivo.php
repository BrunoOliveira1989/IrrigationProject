<main class="main">
    <?php
        renderTitle(
            "Dispositivos",
            "preencha os campos com as informções do dispositivo",
            "circuitry"
        );
    ?>
    <div class="content">
        <form action="#" method="post" class="register" id="register">
            <div class="form-group">
                <div class="input-field">
                    <label for="jardim">Jardim</label>
                    <select class="input" name="jardim" id="jardim" class="input">
                        <option value="">Parque Juca Mulato</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="input-field">
                    <label for="area">Área</label>
                    <input class="input" type="text" name="area" id="area" placeholder="Selecione a Área" />
                </div>
                <div class="input-field">
                    <label for="tip_dispositivo">Tipo de Dispositivo</label>
                    <select class="input" name="tipo_dispositivio" id="tipo_dispositivio">
                        <option value="" selected>Regador</option>
                        <optgroup label="Sensores">
                            <option value="">Umidade</option>
                            <option value="">Temperatura</option>
                        </optgroup>
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
                    <label for="select_pino">Pinos do Arduino</label>
                    <select class="input" name="tipo_dispositivio" id="tipo_dispositivio">
                        <option value="" selected>3</option>
                        <option value="">4</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="input-field">
                    <label for="descricao">Descrição</label>
                    <textarea class="input textarea" name="descricao" id="descricao" cols="30" rows="10"></textarea>
                </div>
            </div>
        </form>
        <div class="btn-box">
            <button type="submit" form="register" class="btn-register">
                <i class="ph-bold ph-check-fat"></i>Cadastrar
            </button>
            <a href="registros_dispositivo.php" class="btn-register cancel">
                <i class="ph-bold ph-x"></i>Cancelar
            </a>
        </div>
    </div>
</main>