import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://hdgamers.b-cdn.net/wp-content/uploads/2019/11/Logotipo-del-FC-Barcelona-para-Dream-League-Soccer.png'),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
          child: FadeInImage(
        image: NetworkImage(
            'https://h5p.org/sites/default/files/h5p/content/1209180/images/file-6113d5f8845dc.jpeg'),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 200),
      )),
    );
  }
}
