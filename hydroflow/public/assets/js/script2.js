function enviarComandos() {
    // Construir a URL com base nos valores dos campos
    var id_jardim = document.getElementById('id_jardim').value;
    var id_area = document.getElementById('id_area').value;
    var url = `http://192.168.1.10:1880/irrigacao/comando/${id_jardim}/${id_area}`;

    // Construir o objeto de dados com as informações do formulário
    var comandos = {
        descricao: "Status do sistema",
        id_jardim: id_jardim,
        id_area: id_area,
        automatico: document.getElementById('automatico').checked,
        valvula: document.getElementById('valvula').checked,
        motor: document.getElementById('motor').checked,
        controle_temperatura: document.getElementById('controle_temperatura').checked,
        controle_umidade: document.getElementById('controle_umidade').checked,
        controle_consumo: document.getElementById('controle_consumo').checked
    };

    // Enviar os dados do formulário via fetch com método PUT
    fetch(url, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(comandos)
    });
}

document.getElementById("register").addEventListener("submit", function(event) {
    event.preventDefault(); // Evita o comportamento padrão de enviar o formulário

    // Construir a URL com base nos valores dos campos
    var id_jardim = document.getElementById('id_jardim').value;
    var id_area = document.getElementById('id_area').value;
    var url = `http://192.168.1.10:1880/irrigacao/parametro/${id_jardim}/${id_area}`;
    let reload;

    // Construir o objeto de dados com as informações do formulário
    var jsonData = {
        // descricao: "Parâmetros do Sistema",
        id_jardim: document.getElementById('id_jardim').value,
        id_area: document.getElementById('id_area').value,
        hora_inicio: document.getElementById('hora_inicio').value,
        duracao: document.getElementById('duracao').value,
        max_umidade: document.getElementById('max_umidade').value,
        min_umidade: document.getElementById('min_umidade').value,
        max_temperatura: document.getElementById('max_temperatura').value,
        min_temperatura: document.getElementById('min_temperatura').value,
        max_volume: document.getElementById('max_volume').value,
        min_volume: document.getElementById('min_volume').value,
        segunda: document.getElementById('segunda').checked,
        terca: document.getElementById('terca').checked,
        quarta: document.getElementById('quarta').checked,
        quinta: document.getElementById('quinta').checked,
        sexta: document.getElementById('sexta').checked,
        sabado: document.getElementById('sabado').checked,
        domingo: document.getElementById('domingo').checked,
    };

    fetch('gravar_parametros.php', {
        method: "POST",
        headers: {
            "Content-Type" : "application/json"
        },
        body: JSON.stringify(jsonData)
    }).then(res => {
        res.json().then(function(data) {
            if(data['success'] == true) return true;
        }).then(
            response => {
                    // Enviar os dados do formulário via fetch com método PUT
                    fetch(url, {
                        method: "PUT",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify(jsonData)
                    })
                    .then(() => {
                        window.location.reload(false);
                    })
                    .catch(() => {
                        alert('erro ao gravar no dispositivo')
                    });
            }
        );
    })
});