<main class="main">
    <?php
    renderTitle(
        "Painel de Controle",
        "Controles dos dispositivos",
        "faders"
    );
    ?>
    <div class="content control">
        <div class="control-column-1">
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
                <span class="error-label">Status do sistema</span>
                <div class="error-status">
                    <span>Sistema funcionando corretamente</span>
                </div>
            </div>
        </div>
        <div class="info">
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
</main>
<script src="progressBar.js"></script>