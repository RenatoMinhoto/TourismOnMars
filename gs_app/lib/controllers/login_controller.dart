import 'package:flutter/material.dart';

class LoginController {

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  bool login() {
    
    String email = emailController.text;
    String senha = senhaController.text;

    if(email == 'admin' && senha == 'admin'){
      print('Login Confirmado');
      return true;
    } else {
      print ('Acesso Negado');
      return false;
    }

  }
}