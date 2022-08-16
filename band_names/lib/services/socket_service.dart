
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:flutter/cupertino.dart';

enum ServerStatus {
  Online,
  Offline,
  Connecting
}

// ChangeNotifier:
// Ayuda a decir al provider cuando tiene que regrescar o
// redibujar la interfaz de usuario o a los widgets

class SocketService with ChangeNotifier {
  
  ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket _socket;

  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _socket;
  Function get emit => _socket.emit;

  SocketService() {
    _initConfig();
  }

  void _initConfig() {
    // Dart client
    _socket = IO.io('http://192.168.0.103:3000', 
    IO.OptionBuilder()
      .setTransports(['websocket'])
      .disableAutoConnect()
      .build()
    );
    _socket.connect();

    _socket.onConnect((_) {
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    // socket.on('nuevo-mensaje', (payload) {
    //   print('nuevo-mensaje');
    //   print('nombre: ' + payload['nombre']);
    //   print('mensaje: ' + payload['mensaje']);
    //   print(payload.containsKey('mensaje2') ? payload['mensaje2'] : 'No hay');
    // });
  }
}