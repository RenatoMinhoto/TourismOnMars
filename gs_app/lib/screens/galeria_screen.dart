import 'package:flutter/material.dart';
import 'package:gs_app/components/galeria_button.dart';

import '../controllers/galeria_controller.dart';

class GaleriaScreen extends StatefulWidget {
  const GaleriaScreen({ Key? key }) : super(key: key);

  @override
  State<GaleriaScreen> createState() => _GaleriaScreenState();
}

class _GaleriaScreenState extends State<GaleriaScreen> {

  GaleriaController controller = GaleriaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Galeria'
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: GaleriaButton(
              texto: controller.selecione? 'Selecione' : 'Selecionar',
              onPressed: () {
                setState(() {
                  controller.selecione = !controller.selecione;
                  if (controller.selecione == false) {
                    controller.contador = 0;
                    controller.cliques = [
                      false, 
                      false, 
                      false, 
                      false, 
                      false, 
                      false, 
                      false, 
                      false, 
                      false, 
                      false, 
                      false, 
                      false, 
                    ];
                  }
                });          
              },
            )
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: controller.selecione,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Imagens Selecionadas: ' + controller.contador.toString(),
                    style: TextStyle(
                      fontSize: 25
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: controller.selecione 
                        ? () {
                          setState(() {
                            controller.cliques[index] = !controller.cliques[index];
                            if (controller.cliques[index]) {
                              controller.contador = controller.contador! + 1;
                            } else {
                              controller.contador = controller.contador! - 1;
                            }                       
                          });
                        } 
                        : null,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              child: Image.asset(
                                controller.imagens[index],
                                fit: BoxFit.fill,
                              ),
                            ),
                            Visibility(
                              visible: controller.cliques[index],
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5)
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.blue,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    gridDelegate: 
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}