import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  
  final ButtonStyle style =
        ElevatedButton.styleFrom(
          elevation: 2,
          padding: const EdgeInsets.all(18),
          shape: const StadiumBorder(),
          textStyle: const TextStyle( fontSize: 20)
        );

  final String text;
  final void Function() onPressed;

  BotonAzul({
    super.key, 
    required this.text, 
    required this.onPressed
  });


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: onPressed, 
      // ignore: sized_box_for_whitespace
      child: Container(
        width: double.infinity,
        child: Center(
          child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 17))
        ),
      )
    );
  }
}