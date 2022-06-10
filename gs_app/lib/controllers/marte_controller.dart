import 'package:flutter/material.dart';
import 'package:gs_app/models/dados_marte.dart';

class MarteController {

  TextEditingController temperaturaController = TextEditingController();
  TextEditingController baseController = TextEditingController();
  
  List<DadosMarte> dados = [];

  void adiciona(String nomeBase, double temperaturaBase) {
    DadosMarte dado = DadosMarte(nomeBase, temperaturaBase);
    dados.add(dado);

    print(dados);
  }
}