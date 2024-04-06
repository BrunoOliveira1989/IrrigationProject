<main class="main">
    <?php
        renderTitle(
            "Parâmetros",
            "Controle os parâmetros de irrigações",
            "faders-horizontal"
        );

        include(TEMPLATE_PATH . "/messages.php")
    ?>
    <div class="content">
        <form action="#" method="post"class="register" id="register">
            <div class="form-group">
                <div class="input-field flex-10">
                    <label for="jardim">Jardim</label>
                    <select class="input" name="jardim" id="jardim" class="input">
                        <option value="" selected>Selecione um Jardim...</option>
                        <?php foreach($jardins as $jardim) : ?>
                            <option value="<?= $jardim->id ?>"><?= $jardim->nome_jardim ?></option>
                        <?php endforeach ?>
                    </select>
                </div>
                <div class="input-field">
                    <label for="id_zona">Zona</label>
                    <select class="input" name="id_zona" id="id_zona">
                        <option value="" id="zona" selected>Selecione uma Zona...</option>
                    </select>
                </div>
            </div>
            <div class="form-box">
                <div class="coluna-1">
                    <div class="form-group">
                        <div class="input-field">
                            <label for="hora_inicio">Hora de início</label>
                            <input type="time" class="input" name="hora_inicio" id="hora_inicio">
                        </div>
                        <div class="input-field">
                            <label for="duracao">Duração (min)</label>
                            <input type="time" class="input" name="duracao" id="duracao">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-field">
                            <label for="max_umidade">Úmidade máxima</label>
                            <input type="number" class="input" min="0" max="100" step="1" name="max_umidade" id="max_umidade">
                        </div>
                        <div class="input-field">
                            <label for="min_umidade">Úmidade mínima</label>
                            <input type="number" class="input" min="0" max="100" step="1" name="min_umidade" id="min_umidade">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-field">
                            <label for="max_temperatura">Temperatura máxima</label>
                            <input type="number" class="input" min="0" max="50" step="1" name="max_temperatura" id="max_temperatura">
                        </div>
                        <div class="input-field">
                            <label for="min_temperatura">Temperatura mínima</label>
                            <input type="number" class="input" min="0" max="50" step="1" name="min_temperatura" id="min_temperatura">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-field">
                            <label for="max_volume">Volume máxima</label>
                            <input type="number" class="input" min="0" max="500" step="1" name="max_volume" id="max_volume">
                        </div>
                        <div class="input-field">
                            <label for="min_volume">Volume mínima</label>
                            <input type="number" class="input" min="0" max="500" step="1" name="min_volume" id="min_volume">
                        </div>
                    </div>
                </div>
                <div class="coluna-2">
                    <div class="form-group checkbox">
                        <div class="input-field">
                            <input type="checkbox" class="input checkbox" name="segunda" id="segunda">
                            <label for="segunda">Segunda-feira</label>
                        </div>
                        <div class="input-field">
                            <input type="checkbox" class="input checkbox" name="terca" id="terca">
                            <label for="terca">Terça-feira</label>
                        </div>
                        <div class="input-field">
                            <input type="checkbox" class="input checkbox" name="quarta" id="quarta">
                            <label for="quarta">Quarta-feira</label>
                        </div>
                        <div class="input-field">
                            <input type="checkbox" class="input checkbox" name="quinta" id="quinta">
                            <label for="quinta">Quinta-feira</label>
                        </div>
                        <div class="input-field">
                            <input type="checkbox" class="input checkbox" name="sexta" id="sexta">
                            <label for="sexta">Sexta-feira</label>
                        </div>
                        <div class="input-field">
                            <input type="checkbox" class="input checkbox" name="sabado" id="sabado">
                            <label for="sabado">Sábado</label>
                        </div>
                        <div class="input-field">
                            <input type="checkbox" class="input checkbox" name="domingo" id="domingo">
                            <label for="domingo">Domingo</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="btn-box">
                <button type="submit" form="register" class="btn-register">
                    <i class="ph-bold ph-check-fat"></i>Salvar
                </button>
                <!-- <a href="registros_dispositivo.php" class="btn-register cancel">
                    <i class="ph-bold ph-x"></i>Cancelar
                </a> -->
            </div>
        </form>
    </div>
</main>