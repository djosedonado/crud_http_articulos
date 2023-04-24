
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../domain/models/articles.dart';
import '../../domain/models/utiles.dart';

class PeticionesArticles {
   
   static Future<List<Articles>> getListArticlesId(String id) async {
    var url = Uri.parse(
        "https://newproyectdanilo.000webhostapp.com/pruebas/listarArticles2.php");

    final response = await http
        .post(url, body: {'id': id});

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista, response.body);
  }

  //consulta
  static Future<List<Articles>> getListArticles() async {
    var url = Uri.parse(
        "https://newproyectdanilo.000webhostapp.com/pruebas/listarArticles.php");

    final response = await http
        .get(url);

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista, response.body);
  }

  static List<Articles> convertirAlista(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    //print(pasar[0]['mensaje']);
    return pasar.map<Articles>((json) => Articles.desdeJson(json)).toList();
  }

// Agregar Articulos
  static Future<List<Mensajes>> addArticle(
      String foto, String detalle, String codigo, String id) async {
    var url = Uri.parse(
        "https://newproyectdanilo.000webhostapp.com/pruebas/agregarArticles.php");

    final response = await http
        .post(url, body: {'fotos': foto, 'detalles': detalle, 'codigos': codigo, 'iduser': id});

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista2, response.body);
  }

  static List<Mensajes> convertirAlista2(String responsebody) {
    final pasar = json.decode(responsebody).cast<Map<String, dynamic>>();
    print(pasar);
    print(pasar[0]['mensaje']);
    return pasar.map<Mensajes>((json) => Mensajes.desdeJson(json)).toList();
  }

  // Editar Articulos
  static Future<List<Mensajes>> EditArticle(String id,
      String foto, String detalle, String codigo, String iduser) async {
    var url = Uri.parse(
        "https://newproyectdanilo.000webhostapp.com/pruebas/editarArticle.php");

    final response = await http
        .post(url, body: {'id': id,'fotos': foto, 'detalles': detalle, 'codigos': codigo, 'iduser': iduser});

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista2, response.body);
  }

  // Eliminar Articulos
  static Future<List<Mensajes>> deleteArticle(String id) async {
    var url = Uri.parse(
        "https://newproyectdanilo.000webhostapp.com/pruebas/eliminarArticle.php");

    final response = await http
        .post(url, body: {'id': id});

    print(response.statusCode);
    print(response.body);
    return compute(convertirAlista2, response.body);
  }
}