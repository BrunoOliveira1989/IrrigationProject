function enviarComandos() {
    // Construir a URL com base nos valores dos campos
    var id_jardim = document.getElementById('id_jardim').value;
    var id_area = document.getElementById('id_area').value;
    var url = `http://10.0.3.125:1880/irrigacao/comando/${id_jardim}/${id_area}`;

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

document.getElementById("formulario").addEventListener("submit", function(event) {
    event.preventDefault(); // Evita o comportamento padrão de enviar o formulário

    // Construir a URL com base nos valores dos campos
    var id_jardim = document.getElementById('id_jardim').value;
    var id_area = document.getElementById('id_area').value;
    var url = `http://10.0.3.125:1880/irrigacao/parametro/${id_jardim}/${id_area}`;

    // Construir o objeto de dados com as informações do formulário
    var jsonData = {
        descricao: "Parâmetros do Sistema",
        id_jardim: document.getElementById('id_jardim').value,
        id_area: document.getElementById('id_area').value,
        horario_inicio: document.getElementById('horario_inicio').value,
        duracao: document.getElementById('duracao').value,
        dias_semana: document.getElementById('dias_semana').value,
        setpoint_umidade: document.getElementById('setpointUmidade').value,
        limite_superior_umidade: document.getElementById('max_umidade').value,
        limite_inferior_umidade: document.getElementById('min_umidade').value,
        limite_superior_temperatura: document.getElementById('max_temperatura').value,
        limite_inferior_temperatura: document.getElementById('min_temperatura').value,
        id_tipo_planta: document.getElementById('idTipoPlanta').value,
        id_tipo_irrigacao: document.getElementById('id_tipo_irrigacao').value
    };

    // Enviar os dados do formulário via fetch com método PUT
    fetch(url, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(jsonData)
    });
});