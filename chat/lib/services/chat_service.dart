import 'package:chat/models/mensajes_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:chat/global/environment.dart';
import 'package:chat/models/usuario.dart';
import 'package:chat/services/auth_service.dart';

class ChatServices with ChangeNotifier {

  late Usuario usuarioPara;
  
  Future<List<Mensaje>> getChat( String usuarioID ) async {
    
    final url = Uri.parse( '${Environment.apiUrl}/mensajes/$usuarioID');

    final http.Response response = await http.get(url, 
      headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken() ?? ''
      }
    );

    final mensajesResp = mensajesResponseFromJson( response.body);

    return mensajesResp.mensajes;
    
  }
  


}