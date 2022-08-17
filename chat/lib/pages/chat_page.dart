import 'dart:io';

import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin{ //permite las animaciones TickerProviderStateMixin

  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  
  // ignore: prefer_final_fields
  List<ChatMessage> _messages = [];
  
  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
              child: const Text('Te', style: TextStyle(fontSize: 12)),
            ),
            const SizedBox(height: 3),
            const Text('Melissa Flores', style: TextStyle(color: Colors.black87, fontSize: 12),)
          ]
        ),
        centerTitle: true,
        elevation: 1,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: <Widget>[
            
            Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (_,i) => _messages[i],
                reverse: true,
              )
            ),
            
            const Divider(height: 1),

            Container(
              // height: 100,
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      )
   );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String texto) {
                  setState(() {
                    // ignore: prefer_is_empty
                    if (texto.trim().length > 0) {
                      _estaEscribiendo = true;
                    } else {
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration: const InputDecoration.collapsed(
                  hintText: 'Enviar mensaje'
                ),
                focusNode: _focusNode,
              )
            ),
            
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
              ? CupertinoButton(
                  onPressed: _estaEscribiendo
                  ? () => _handleSubmit(_textController.text)
                  : null,
                  child: const Text('Enviar'), 
                )
              : Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconTheme(
                  data: IconThemeData(color: Colors.blue[400]),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: const Icon(Icons.send),
                    onPressed: _estaEscribiendo
                    ? () => _handleSubmit(_textController.text)
                    : null,
                  ),
                ),
              )
            )
          ],
        ),
      )
    );

  }

  _handleSubmit(String texto) {
    
    if (texto.isEmpty) return;

    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMessage(
      uid: '123', 
      texto: texto,
      animationController: AnimationController(vsync: this, duration: const Duration(milliseconds: 200))
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    
    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    // TODO off del socket
    for (ChatMessage message in _messages) {
      message.animationController.dispose();      
    }
    super.dispose();
  }

}