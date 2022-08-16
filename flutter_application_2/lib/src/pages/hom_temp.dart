import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Componentes Temp')),
      body: ListView(
          // children: _crearItems()
          children: _crearItemsCorta()),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = <Widget>[];

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista
        ..add(tempWidget)
        ..add(Divider(
          height: 10.0,
        ));
    }

    return lista;
  }

  List<Widget> _crearItemsCorta() {
    var widgets = opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + ' !'),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          const Divider()
        ],
      );
    }).toList();

    return widgets;
  }
}
