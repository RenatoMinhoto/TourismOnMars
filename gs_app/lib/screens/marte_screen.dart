import 'package:flutter/material.dart';
import 'package:gs_app/controllers/marte_controller.dart';

class MarteScreen extends StatefulWidget {
  const MarteScreen({ Key? key }) : super(key: key);

  @override
  State<MarteScreen> createState() => _MarteScreenState();
}

class _MarteScreenState extends State<MarteScreen> {
  MarteController controller = MarteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Marte'
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                'Insira os dados',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                width: 360,
                child: TextField(
                  controller: controller.temperaturaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    hintText: 'Temperatura',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: 360,
                child: TextField(
                  controller: controller.baseController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    hintText: 'Base',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                child: Text(
                  'Enviar'
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    150, 40
                  )
                ),
                onPressed: () {
                  setState(() {
                    controller.adiciona(controller.baseController.text, double.tryParse(controller.temperaturaController.text)!);
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                width: 360,
                child: ListView.builder(
                  itemCount: controller.dados.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Base: ' + controller.dados[index].nomeBase.toString(),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Temperatura: ' + controller.dados[index].temperaturaBase.toString(),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )          
          ]
        )
      )
    );
  }
}