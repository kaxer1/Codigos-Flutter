// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:chat/global/environment.dart';

import 'package:chat/models/usuario.dart';
import 'package:chat/models/login_response.dart';

class AuthService with ChangeNotifier {
  
  late Usuario usuario;
  bool _autenticando = false;
  // Create storage
  final _storage = const FlutterSecureStorage();


  bool get autenticando => _autenticando;
  set autenticando(bool valor) {
    _autenticando = valor;
    notifyListeners();
  }

  // Getters del token de forma estatica
  static Future<String?> getToken() async {
    const _storage = FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    // ignore: prefer_const_constructors
    const _storage = FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future<bool> login(String email, String password) async {
    
    autenticando = true;

    final data ={
      'email': email,
      'password': password
    };

    final url = Uri.parse( '${Environment.apiUrl}/login');

    final http.Response response = await http.post(url, 
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data)
    );

    autenticando = false;

    if (response.statusCode == 200) {
      final loginResponse = loginResponseFromJson(response.body);
      usuario = loginResponse.usuario;
      
      await _guardarToken(loginResponse.token);

      return true;
    } else {
      return false;
    }
    
  }

  Future register(String nombre, String email, String password) async {
    autenticando = true;

    final data ={
      'nombre': nombre,
      'email': email,
      'password': password
    };

    final url = Uri.parse( '${Environment.apiUrl}/login/new');

    final http.Response response = await http.post(url, 
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data)
    );

    autenticando = false;

    if (response.statusCode == 200) {
      final loginResponse = loginResponseFromJson(response.body);
      usuario = loginResponse.usuario;
      
      await _guardarToken(loginResponse.token);

      return true;
    } else {
      final respBody = jsonDecode(response.body);
      return respBody['msg'];
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'token');

    final url = Uri.parse( '${Environment.apiUrl}/login/renew');

    final http.Response response = await http.get(url, 
      headers: {
        'Content-Type': 'application/json',
        'x-token': token ?? ''
      }
    );

    if (response.statusCode == 200) {
      final loginResponse = loginResponseFromJson(response.body);
      usuario = loginResponse.usuario;
      
      await _guardarToken(loginResponse.token);

      return true;
    } else {
      logout();
      return false;
    }

  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    await _storage.delete(key: 'token');
  }

}