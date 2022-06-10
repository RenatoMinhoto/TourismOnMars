import 'dart:async';

import 'package:rxdart/rxdart.dart';

class MenuController {
  Timer? tempo; 
  final dias = BehaviorSubject<int?>.seeded(0);

  void disposeController(){
    dias.close();
  }

  void startTimer(){
    tempo = Timer.periodic(Duration(seconds: 10), (_) {
      dias.sink.add(dias.value!+1);
    });
  }
}