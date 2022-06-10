import 'package:flutter/material.dart';
import 'package:gs_app/controllers/login_controller.dart';
import 'package:gs_app/screens/marte_screen.dart';
import 'package:gs_app/screens/menu_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login'
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                'Faça seu Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              width: 300,
              height: 300,
              child: Image.asset(
                'assets/images/pngegg.png'
              ),
            ),
            Container(
              width: 360,
              child: TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  hintText: 'E-mail',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: 360,
                child: TextField(
                  obscureText: true,
                  controller: controller.senhaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    hintText: 'Senha',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                child: Text(
                  'Entrar'
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    150, 40
                  )
                ),
                onPressed: () {
                  bool retorno = controller.login();
                  if(retorno == true){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return MenuScreen();
                      })
                    );
                  } else {
                    showDialog(
                      context: context, 
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text(
                            'Usuario invalido!'
                          ),
                        );
                      }
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 215),
              child: ElevatedButton(
                child: Text(
                  'Sobre'
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    150, 40
                  )
                ),
                onPressed: () {
                    showDialog(
                      context: context, 
                      builder: (BuildContext context){
                        return Container(
                          child: AlertDialog(
                            title: Column(
                              children: [
                                Text(
                                  'Pedro Henrique Fernandes'
                                ),
                                Text(
                                  'RM 84130'
                                ),
                                Text(
                                  ''
                                ),
                                Text(                                  
                                  'Renato Minhoto'
                                ),
                                Text(
                                  'RM 85374'
                                ),
                                Text(
                                  ''
                                ),
                                Text(
                                  'Turma: 3SIR'
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}