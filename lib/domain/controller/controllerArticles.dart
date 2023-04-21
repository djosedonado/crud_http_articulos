
import 'package:get/get.dart';

import '../../data/services/peticionesArticles.dart';
import '../models/articles.dart';
import '../models/utiles.dart';

class ControlArticles extends GetxController {
  final Rxn<List<Mensajes>> _listarMensajes = Rxn<List<Mensajes>>([]);
  final Rxn<List<Articles>> listaArticle = Rxn<List<Articles>>([]);

  Future<void> listArticles() async {
    listaArticle.value = await PeticionesArticles.getListArticles();
  }

  Future<void> addArticle(String foto, String detalle, String codigo,String id) async {
    _listarMensajes.value = await PeticionesArticles.addArticle(foto, detalle, codigo,id);
  }

  Future<void> editArticle(String id,String foto, String detalle, String codigo,String iduser) async {
    _listarMensajes.value = await PeticionesArticles.EditArticle(id,foto, detalle, codigo,iduser);
  }

  Future<void> deleteArticle(String id) async {
    _listarMensajes.value = await PeticionesArticles.deleteArticle(id);
  }

  List<Mensajes>? get listaMensajes => _listarMensajes.value;
  List<Articles>? get listaArticlesFinal => listaArticle.value;
}
