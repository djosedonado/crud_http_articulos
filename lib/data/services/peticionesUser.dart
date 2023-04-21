import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../domain/models/user.dart';
import '../../domain/models/utiles.dart';

class PeticionesUser {
  static Future<List<Mensajes>> registrarUser(
      String nombre, String u, String p) async {
    var url = Uri.parse(
        "https://newproyectdanilo.000webhostapp.com/pruebas/agregarUser.php");

    final response = await http
        .post(url, body: {'nombre': nombre, 'user': u, 'password': p});

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista, response.body);
  }

  static List<Mensajes> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    print(pasar[0]['mensaje']);
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  static Future<List<User>> validarUser(String u, String p) async {
    var url = Uri.parse(
        "https://newproyectdanilo.000webhostapp.com/pruebas/validarUser.php");

    final response = await http.post(url, body: {'user': u, 'pass': p});

    return compute(convertirAlista2, response.body);
  }

  static List<User> convertirAlista2(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    return pasar.map<User>((json) => User.desdeJson(json)).toList();
  }
}
