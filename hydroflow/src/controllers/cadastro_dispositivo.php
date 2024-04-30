<?php
session_start();
requireValidSession();

loadModel("Dispositivo");
loadModel("Jardim");
loadModel("Zona");

$exception = null;
$dados = [];

if(count($_POST) === 0 && isset($_GET['update'])){
    $dispositivo = Dispositivo::getOne(['id' => $_GET['update']]);
    $dados = $dispositivo->getValues();
    $id_jardim = Zona::getOne(['id' => $dados['id_zona']], 'id_jardim');
    $id = $id_jardim->getValues();
    $dados['id_jardim'] = $id['id_jardim'];
} elseif(count($_POST) > 0) {
    try {
        $novoDispositivo = new Dispositivo($_POST);
        if($novoDispositivo->id){
            $novoDispositivo->update();
            addMsgSucesso("Dispositivo atualizado com sucesso");
            header("Location: registros_dispositivo.php");
            exit();
        } else {
            $novoDispositivo->inserir();
            addMsgSucesso("Dispositivo cadastrado com sucesso");
            header("Location: registros_dispositivo.php");
            exit();
        }
        $_POST = [];
    } catch(Exception $e) {
        $exception = $e;
    } finally {
        $dados = $_POST;
    }
}

$tipoDispositivos = Dispositivo::getFromOtherTable("tiposdispositivos");
$jardins = Jardim::get([], 'id, nome_jardim');

loadTemplateView("cadastro_dispositivo", $dados + [
    'nomeCss' => 'cadastro',
    'exception' => $exception,
    'tipoDispositivos' => $tipoDispositivos,
    'jardins' => $jardins
]);