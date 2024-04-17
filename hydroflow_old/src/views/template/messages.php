<?php

$errors = [];

if(isset($_SESSION['message'])) {
    $message = $_SESSION['message'];
    unset($_SESSION['message']);
}

if($exception) {
    $message = [
        'type' => 'error',
        'message' => $exception->getMessage()
    ];

    if(get_class($exception) === 'ValidationException') {
        $errors = $exception->getErros();
    }
}

$alertType = '';

if(!empty($message != null) && ($message['type'] === 'error')) {
    $alertType = 'alerta';
}

?>

<?php if(!empty($message)) : ?>
    <div class="menssagem <?= $alertType ?>">
        <div class="icon-box">
          <i class="ph-bold ph-warning"></i>
        </div>
        <p><?= $message['message'] ?></p>
        <i class="icon ph-bold ph-x"></i>
    </div>
<?php endif ?>