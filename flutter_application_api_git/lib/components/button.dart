import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.text, required this.onPressed});
  final String text;
  //voidCallback é uma funcao void sem valor de input ou output
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary:
              Colors.deepOrange // Define a cor de fundo do botão como verde
          ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
  }
}
