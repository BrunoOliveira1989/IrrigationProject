$(document).ready(function() {
    // Define a função para atualizar os valores e o gráfico
    function valor_atual() {
        $.ajax({
            url: 'influxdb_query_valor_atual.php',
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                $('#lista-valores').empty();
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

                    const umidadeInput = document.querySelector('#umidade');
                    const temperaturaInput = document.querySelector('#temperatura');
                    const vazaoInput = document.querySelector('#vazao');
                    const motorInput = document.querySelector('#motor');
                    const valvulaInput = document.querySelector('#valvula');

                    umidadeInput.value = umidadeAr;
                    temperaturaInput.dataset.value = temperatura;
                    vazaoInput.value = vazao;
                    motor > 0 ? motorInput.innerText = 'Ligado' : motorInput.innerText = 'Desligado';
                    valvula > 0 ? valvulaInput.innerText = 'Ligado' : valvulaInput.innerText = 'Desligado';
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
