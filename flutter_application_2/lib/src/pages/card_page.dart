import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text(
                'sjkjk aksjdfk asklfj alskdjf laskdjf alsjflak sdfjlaks jfdlkasjd fklajsfk lasjflaksj flaksj fdlkajs dlk fjalskdjf al;kjdf;alsjklf ajlskdf jalkj fla;skj dfl;aksj fd;lak sjdfl;aksjdflkajsdflkajsdf l;ajsd fl laksdjf'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: () {}, child: Text('Cancelar')),
              FlatButton(onPressed: () {}, child: Text('Okey'))
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    return Card(
      elevation: 10.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(children: <Widget>[
        FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(
              'https://i.pinimg.com/originals/a7/fc/aa/a7fcaa43650adc892c401956a08dc32a.jpg'),
          fadeInDuration: Duration(milliseconds: 200),
          height: 350.0,
          fit: BoxFit.cover,
        ),
        Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea de que poner')),
      ]),
    );
  }
}
