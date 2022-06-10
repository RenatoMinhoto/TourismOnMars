import 'package:flutter/material.dart';
import 'package:gs_app/components/main_button.dart';
import 'package:gs_app/screens/galeria_screen.dart';
import 'package:gs_app/screens/marte_screen.dart';

import '../controllers/menu_controller.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({ Key? key }) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  MenuController controller = MenuController();
  @override
  void initState() {
    controller.startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu'
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/grugg.jpg'),
            fit: BoxFit.fill
          ),
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 130),
                    child: Text(
                      'Selecione uma página',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),              
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:25, left: 190),
                    child: MainButton(
                      texto: 'Cadastre uma temperatura',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (BuildContext context) {
                              return MarteScreen();
                            })
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20, left: 190),
                    child: MainButton(
                      texto: 'Galeria Marciana',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) {
                            return GaleriaScreen();
                          })
                        );
                      },
                    )
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:30, right: 150),
                    child: StreamBuilder<int?>(
                      stream: controller.dias.stream,
                      builder: (context, snapshot) {
                        return Text(
                          'Contador de dias: ' + controller.dias.value.toString(),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),
                        );
                      }
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

