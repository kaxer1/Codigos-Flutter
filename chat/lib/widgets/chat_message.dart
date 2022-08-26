import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatMessage extends StatelessWidget {
  // const ChatMessage({Key? key}) : super(key: key);

  final String uid;
  final String texto;
  final AnimationController animationController;

  const ChatMessage({
    super.key, 
    required this.uid,
    required this.texto,
    required this.animationController // Permite controlar la animacion
  });

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return FadeTransition( // animacion de transicion
      opacity: animationController,
      child: SizeTransition( // transforma el tamaño del widget
        sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container(
          child: uid == authService.usuario.uid
          ? _myMessage()
          : _noMyMessage(),
        ),
      ),
    );
  }

  _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(
          right: 5,
          bottom: 5,
          left: 50
        ),
        decoration: BoxDecoration(
          color: const Color(0xff4D9EF6),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Text(texto, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  _noMyMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(
          bottom: 5,
          left: 5,
          right: 50
        ),
        decoration: BoxDecoration(
          color: const Color(0xffE4E5E8),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Text(texto, style: const TextStyle(color: Colors.black87)),
      ),
    );
  }

}