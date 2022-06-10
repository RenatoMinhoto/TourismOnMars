import 'package:flutter/material.dart';
import 'package:gs_app/screens/marte_screen.dart';

class MainButton extends StatelessWidget {

  final String? texto;
  final Function()? onPressed;

  const MainButton({
    Key? key, 
    required this.texto,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        texto!
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          250, 40
        )
      ),
      onPressed: onPressed!
    );
  }
}