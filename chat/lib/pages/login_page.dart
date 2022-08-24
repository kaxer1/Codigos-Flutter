import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat/helpers/mostrar_alerta.dart';

import 'package:chat/services/auth_service.dart';

import 'package:chat/widgets/boton_azul.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                Logo(titulo: 'Messenger'),
                _From(),
                Labels(
                  ruta: 'register', 
                  titulo: 'No tienes cuenta?',
                  subTitulo: 'Crea una ahora!',
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

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    final authService = Provider.of<AuthService>(context, listen: false);
    // ignore: avoid_unnecessary_containers
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[

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
            onPressed: authService.autenticando ? null : () async {
              FocusScope.of(context).unfocus(); // para quitar teclado o quitar focus en formulario
              
              final loginOk = await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());

              if (loginOk) {
                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, 'usuarios');
              } else {
                // ignore: use_build_context_synchronously
                mostrarAlerta(context,'Login incorrecto', 'Revise sus credenciales nuevamente');
              }

            } 
          )
        ]
      ),
    );
  }
}
