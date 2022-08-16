import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final estiloTexto = new TextStyle(fontSize: 25);

  int conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Título'), centerTitle: true),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text('Número de clicks:', style: estiloTexto),
              Text('$conteo', style: estiloTexto)
            ])),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            conteo = conteo + 1;
            print("hola mundo");
          },
        ));
  }
}
