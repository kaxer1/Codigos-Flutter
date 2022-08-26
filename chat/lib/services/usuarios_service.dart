
import 'package:chat/models/usuarios_response.dart';
import 'package:chat/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:chat/global/environment.dart';
import 'package:chat/models/usuario.dart';

class UsuariosService {

  Future<List<Usuario>> getUsuarios() async {

    try {
      final url = Uri.parse( '${Environment.apiUrl}/usuarios');

      final http.Response response = await http.get(url, 
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthService.getToken() ?? ''
        }
      );

      final usuariosResponse = usuariosResponseFromJson(response.body);

      return usuariosResponse.usuarios;
    } catch (e) {
      return [];
    }
  }
}