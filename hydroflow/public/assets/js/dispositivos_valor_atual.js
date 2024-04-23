const setUmidade = valor => {
    const umidade = document.querySelector('#umidade');
    const umidadeLabel = document.querySelector('#umidadeLabel');
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

$(document).ready(function() {
    // Define a função para atualizar os valores e o gráfico
    function valor_atual() {
        $.ajax({
            url: 'influxdb_query_valor_atual.php',
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                $.each(data, function(index, value) {
                    let time = value['time'];
                    let consumoAgua = value['consumo_agua'];
                    let motor = value['motor'];
                    let temperatura = value['temperatura'];
                    let umidadeAr = value['umidade_ar'];
                    let umidadeSolo = value['umidade_solo'];
                    let valvula = value['valvula'];
                    let vazao = value['vazao'];

                    // $('#lista-valores').append('<li><strong>' + time + '</strong>: ' + consumoAgua + ' (consumo de água), ' + motor + ' (motor), ' + temperatura + ' (temperatura), ' + umidadeAr + ' (umidade do ar), ' + umidadeSolo + ' (umidade do solo), ' + valvula + ' (válvula), ' + vazao + ' (vazão)</li>');

                    setUmidade(umidadeAr);
                    setTemperatura(temperatura);
                    setVazao(vazao);                    
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
