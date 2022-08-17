import 'package:flutter/material.dart';
import 'package:chat/widgets/boton_azul.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          // ignore: sized_box_for_whitespace
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Logo(titulo: 'Registro'),
                _From(),
                Labels(ruta: 'login', 
                  titulo: 'Ya tienes una cuenta?', 
                  subTitulo: 'Ingresa ahora!'
                ),
                Text('Terminos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200),)
              ],
            ),
          ),
        ),
      )
   );
  }
}

class _From extends StatefulWidget {
  const _From({Key? key}) : super(key: key);

  @override
  State<_From> createState() => __FromState();
}

class __FromState extends State<_From> {

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[

          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            keyboardType: TextInputType.text,
            textController: nameCtrl,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),

          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),
          BotonAzul(
            text: 'Ingrese', 
            onPressed: () {
              // ignore: avoid_print
              print(emailCtrl.text);
              // ignore: avoid_print
              print(passCtrl.text);
            } 
          )
        ]
      ),
    );
  }
}
