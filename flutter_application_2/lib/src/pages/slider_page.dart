import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Slider'),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              children: <Widget>[
                _crearSlider(),
                _cheakBox(),
                _cheakSwitch(),
                Expanded(child: _crearImagen())
              ],
            )));
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamanio de la imagen',
      // divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _cheakBox() {
    // return Checkbox(
    //     value: _bloquearCheck,
    //     onChanged: (valor) {
    //       setState(() {
    //         _bloquearCheck = valor ?? false;
    //       });
    //     });
    return CheckboxListTile(
        title: Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor ?? false;
          });
        });
  }

  Widget _cheakSwitch() {
    return SwitchListTile(
        title: Text('Bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://i.blogs.es/94d4c1/devil-may-cry-5-analisis-01/1366_2000.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}
