<?php

loadModel('User');

class Login extends Model {

    public function validate() {
        $errors = [];

        if(!$this->user) {
            $erros['user'] = "Por favor, informe o usuário.";
        }

        if(!$this->passwrod) {
            $erros['password'] = "Por favor, informe a senha.";
        }

        if(count($errors) > 0) {
            throw new ValidationException($erros);
        }
    }
    public function checkLogin() {
        $this->validate();
        $user = User::getOne(['user' => $this->user]);
        if($user) {
            if(password_verify($this->password, $user->password)) {
                return $user;
            }
        }
        throw new AppException("Usuário e Senha inválidos.");
        
    }
}
