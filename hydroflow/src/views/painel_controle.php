<main class="main">
    <?php
        renderTitle(
            "Painel de Controle",
            "Gerencie",
            "faders"
        );
    ?>
    <div class="content control">
        <div class="control-column">
            <div class="control-switches">
                <div class="control-switch">
                    <sapn class="control-label"><i class="icon ph-bold ph-gear-six"></i>Automático</sapn>
                    <div class="switch">
                        <input type="checkbox" class="switch-input" id="switch-auto">
                        <label for="switch-auto" class="switch-label"></label>
                    </div>
                </div>
                <div class="control-switch">
                    <sapn class="control-label"><i class="icon ph-bold ph-funnel"></i>Valvula</sapn>
                    <div class="switch">
                        <input type="checkbox" class="switch-input" id="switch-valve">
                        <label for="switch-valve" class="switch-label"></label>
                    </div>
                </div>
                <div class="control-switch">
                    <sapn class="control-label"><i class="icon ph-bold ph-engine"></i>Bomba</sapn>
                    <div class="switch">
                        <input type="checkbox" class="switch-input" id="switch-bomb">
                        <label for="switch-bomb" class="switch-label"></label>
                    </div>
                </div>
                <div class="control-switch">
                    <sapn class="control-label"><i class="icon ph-bold ph-thermometer"></i>Temperatura</sapn>
                    <div class="switch">
                        <input type="checkbox" class="switch-input" id="switch-temp">
                        <label for="switch-temp" class="switch-label"></label>
                    </div>
                </div>
                <div class="control-switch">
                    <sapn class="control-label"><i class="icon ph-bold ph-drop"></i>Umidade</sapn>
                    <div class="switch">
                        <input type="checkbox" class="switch-input" id="switch-umid">
                        <label for="switch-umid" class="switch-label"></label>
                    </div>
                </div>
                <div class="control-switch">
                    <sapn class="control-label"><i class="icon ph-bold ph-cube-transparent"></i>Volume</sapn>
                    <div class="switch">
                        <input type="checkbox" class="switch-input" id="switch-volume">
                        <label for="switch-volume" class="switch-label"></label>
                    </div>
                </div>
            </div>
            <div class="error-display">
                <span class="error-label">Sistema</span>
                <div class="error-box">
                    <i class="icon ph-bold ph-monitor"></i>
                    <div class="error-status">
                        <span>status: Funcional</span>
                        <span>Erro: nenhum</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="info">
            <div class="info-row">
                <div class="info-item">
                    <div class="progress" role="progressbar">
                        <div class="progress-inner">
                            <div class="progress-indicator"></div>
                        </div>
                        <span class="progress-label">
                            <p><i class="ph-bold ph-drop"></i></p>
                            <strong>0</strong>
                            <span>%</span>
                        </span>
                    </div>
                    <input type="number" min="0" max="50" step="1">
                </div>
                <div class="info-item">
                    <div class="progress thermometer" role="progressbar">
                        <div class="progress-inner">
                            <div class="progress-indicator"></div>
                        </div>
                        <span class="progress-label">
                            <p><i class="ph-bold ph-thermometer"></i></p>
                            <strong>0</strong>
                            <span>°C</span>
                        </span>
                    </div>
                    <input id="thermometer" type="number" min="0" max="50" step="1">
                </div>
                <div class="info-item">
                    <div class="vazao-container">
                        <input type="checkbox" id="agua" class="vazao-input">
                        <div class="indicator">
                            <div class="detalhe"></div>
                            <label for="agua" class="corpo">
                                <div class="fill"></div>
                            </label>
                            <div class="detalhe right"></div>
                        </div>
                        <span class="vazao-label">
                            <p>
                                <i class="icon ph-bold ph-wind"></i>
                            </p>
                            <strong class="vazao">300</strong>
                            <span class="unit-vazao">m/s</span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="info-row"></div>
        </div>
</main>
<script src="/assets/js/progressBar.js"></script>