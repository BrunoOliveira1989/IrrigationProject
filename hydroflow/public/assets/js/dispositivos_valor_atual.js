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
                    var time = value['time'];
                    var consumoAgua = value['consumo_agua'];
                    var motor = value['motor'];
                    var temperatura = value['temperatura'];
                    var umidadeAr = value['umidade_ar'];
                    var umidadeSolo = value['umidade_solo'];
                    var valvula = value['valvula'];
                    var vazao = value['vazao'];

                    $('#lista-valores').append('<li><strong>' + time + '</strong>: ' + consumoAgua + ' (consumo de água), ' + motor + ' (motor), ' + temperatura + ' (temperatura), ' + umidadeAr + ' (umidade do ar), ' + umidadeSolo + ' (umidade do solo), ' + valvula + ' (válvula), ' + vazao + ' (vazão)</li>');
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
