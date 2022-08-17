import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  final String titulo;

  const Logo({
    super.key, 
    required this.titulo
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      // ignore: sized_box_for_whitespace
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        width: 170,
        child: Column(
          children: <Widget>[
            const Image(image: AssetImage('assets/tag-logo.png')),
            const SizedBox(height: 20),
            Text(titulo, style: const TextStyle(fontSize: 30))
          ]
        ),
      ),
    );
  }
}