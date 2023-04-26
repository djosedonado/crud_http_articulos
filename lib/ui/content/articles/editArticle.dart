import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/controller/controllerArticles.dart';
import '../../../domain/controller/controllerUser.dart';

class EditArticle extends StatelessWidget {
  const EditArticle({super.key});

  @override
  Widget build(BuildContext context) {
    ControlArticles controla = Get.find();
    ControlUser controlu = Get.find();
    TextEditingController foto = TextEditingController();
    TextEditingController detalle = TextEditingController();
    TextEditingController codigo = TextEditingController();
    foto.text = controla
        .listaArticlesFinal![controla.listaArticlesFinal![0].idice].foto;
    detalle.text = controla
        .listaArticlesFinal![controla.listaArticlesFinal![0].idice].detalle;
    codigo.text = controla
        .listaArticlesFinal![controla.listaArticlesFinal![0].idice].codigo;
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Articulos"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                right: 35,
                left: 35,
                top: MediaQuery.of(context).size.height * 0.27),
            child: Column(children: [
              TextField(
                controller: foto,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 12, 11, 11)),
                  ),
                  hintText: 'url',
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: detalle,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 12, 12, 12)),
                  ),
                  hintText: 'detalle',
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 17, 16, 16)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: codigo,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 10, 10, 10)),
                  ),
                  hintText: 'codigo',
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 2, 2, 2)),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(
                  'Agregar',
                  style: TextStyle(
                    color: Color.fromARGB(255, 14, 13, 13),
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xff4c505b),
                  child: IconButton(
                    color: const Color.fromARGB(255, 7, 6, 6),
                    onPressed: () {
                      controla
                          .editArticle(
                              controla
                                  .listaArticlesFinal![
                                      controla.listaArticlesFinal![0].idice]
                                  .id
                                  .toString(),
                              foto.text,
                              detalle.text,
                              codigo.text,
                              controlu.listaUserLogin![0].id.toString())
                          .then((value) {
                        controla.listArticlesId(
                            controlu.listaUserLogin![0].id.toString());
                        controla.listaArticle.refresh();
                        Get.snackbar(
                            'Clientes', controla.listaMensajes![0].mensaje,
                            duration: const Duration(seconds: 3),
                            icon: const Icon(Icons.info),
                            shouldIconPulse: true,
                            backgroundColor: Color.fromARGB(255, 10, 167, 202));
                      });
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ),
              ]),
              const SizedBox(
                height: 40,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'Inicio',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}
