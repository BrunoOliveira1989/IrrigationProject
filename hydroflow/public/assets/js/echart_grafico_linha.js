// Inicializa o gráfico ECharts no elemento HTML com o ID "echarts"
var chart = echarts.init(document.getElementById('echarts_grafico_linha'));

//function fetchTrend(consultaSelecionada) {
$.ajax({
    // Substitua pela URL apropriada para o seu back-end
    url: 'influxdb_query.php?consulta=',
    type: 'GET',
    dataType: 'json',
    async: false, // Define a solicitação como síncrona

    success: function (data) {
        // Os dados obtidos do servidor são armazenados na variável "data"
        var echartsData = data;

        // Configuração das opções do gráfico ECharts
        var options = {
            backgroundColor: 'transparent',
            tooltip: {
                trigger: 'axis',
            },
            legend: {
                data: ['Processo'],
                textStyle: {
                    color: 'rgba(128, 128, 128, .9)',
                },
            },
            toolbox: {
                feature: {
                    dataZoom: {
                        yAxisIndex: 'none',
                        icon: {
                            zoom: 'path://',
                            back: 'path://',
                        },
                    },
                    saveAsImage: {},
                }
            },
            xAxis: {
                type: 'time',
            },
            yAxis: {
                type: 'value',
                min: 'dataMin',
            },
            grid: {
                left: '2%',
                right: '2%',
                top: '2%',
                bottom: 24,
                containLabel: true,
            },
            series: [
                {
                    name: 'Processo',
                    type: 'line',
                    showSymbol: false,
                    areaStyle: {
                        opacity: 0.1,
                    },
                    lineStyle: {
                        width: 1,
                    },
                    data: echartsData.map(function (data) {
                        return [data.time, data.value.toFixed(2)];
                    }),
                },
            ],
        };

        // Define as opções no gráfico ECharts
        chart.setOption(options);
    },
    error: function (xhr, status, error) {
        // Se ocorrer um erro na solicitação AJAX, exibe uma mensagem de erro no console
        console.error('Erro na solicitação AJAX: ' + error);
    }
});
