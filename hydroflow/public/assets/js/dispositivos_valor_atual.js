const setUmidadeAr = valor => {
    const umidade = document.querySelector('#umidadeAr');
    const umidadeLabel = document.querySelector('#umidadeArLabel');
    valor = valor <= 100 && valor >= 0 ? valor : 0;
    umidadeLabel.textContent = valor;
    umidade.style.setProperty('--progress-value', valor);
    umidade.dataset.value = valor;
};

const setUmidadeSolo = valor => {
    const umidade = document.querySelector('#umidadeSolo');
    const umidadeLabel = document.querySelector('#umidadeSoloLabel');
    valor = valor <= 100 && valor >= 0 ? valor : 0;
    umidadeLabel.textContent = valor;
    umidade.style.setProperty('--progress-value', valor);
    umidade.dataset.value = valor;
};

const setTemperatura = valor => {
    const temperatura = document.querySelector('#temperatura');
    const temperaturaLabel = document.querySelector('#temperaturaLabel');
    valor = valor <= 100 && valor >= 0 ? valor : 0;
    temperaturaLabel.textContent = valor;
    temperatura.style.setProperty('--progress-value', valor);
    temperatura.dataset.value = valor;
};

const setVazao = valor => {
    const vazaoLabel = document.querySelector('#vazaoLabel');
    valor = valor <= 800 && valor >= 0 ? valor : 0;
    vazaoLabel.textContent = valor;
};

const inputArea = document.querySelector('#id_area');

inputArea.addEventListener('change', () => {
    const idJardim = document.querySelector('#id_jardim').value;
    const idArea = inputArea.value;
    $(document).ready(function() {
        // Define a função para atualizar os valores e o gráfico
        function valor_atual() {
            $.ajax({
                url: `influxdb_query_valor_atual.php?idjardim=${idJardim}&idArea${idArea}`,
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    $.each(data, function(index, value) {
                        let time = Number(value['time']);
                        let consumoAgua = Number(value['consumo_agua']);
                        let motor = Number(value['motor']);
                        let temperatura = Number(value['temperatura']);
                        let umidadeAr = Number(value['umidade_ar']);
                        let umidadeSolo = Number(value['umidade_solo']);
                        let valvula = Number(value['valvula']);
                        let vazao = Number(value['vazao']);
    
                        // $('#lista-valores').append('<li><strong>' + time + '</strong>: ' + consumoAgua + ' (consumo de água), ' + motor + ' (motor), ' + temperatura + ' (temperatura), ' + umidadeAr + ' (umidade do ar), ' + umidadeSolo + ' (umidade do solo), ' + valvula + ' (válvula), ' + vazao + ' (vazão)</li>');
    
                        setUmidadeSolo(umidadeSolo.toFixed());
                        setUmidadeAr(umidadeAr.toFixed());
                        setTemperatura(temperatura.toFixed(1));
                        setVazao(vazao.toFixed());                    
                    });
                },
                error: function(xhr, status, error) {
                    console.error('Erro ao carregar os valores do InfluxDB:', error);
                }
            });
        }
        
        // Chama a função valor_atual() a cada segundo (1000 milissegundos)
        setInterval(valor_atual, 1000);
    });
});
