
import 'package:chat/global/environment.dart';
import 'package:chat/services/auth_service.dart';
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

  void conect() async {
    final token = await AuthService.getToken();

    // Dart client
    _socket = IO.io( Environment.socketUrl, 
    IO.OptionBuilder()
      .enableForceNew()
      .setTransports(['websocket'])
      .setExtraHeaders({'x-token': token})
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

  }

  void disconnect () {
    _socket.disconnect();
  }
}