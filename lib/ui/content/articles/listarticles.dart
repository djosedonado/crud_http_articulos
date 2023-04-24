import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/controller/controllerArticles.dart';
import '../../../domain/controller/controllerUser.dart';

class ListArticles extends StatelessWidget {
  const ListArticles({super.key});
  @override
  Widget build(BuildContext context) {
    ControlArticles controla = Get.find();
    ControlUser controlu = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listado de Articulos"),
        actions: [
          IconButton(onPressed: (){
            controla.listArticlesId(controlu.listaUserLogin![0].id.toString());
            controla.listaArticle.refresh();
          }, icon: Icon(Icons.update))
        ],
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controla.listaArticlesFinal!.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(controla.listaArticlesFinal![index].foto),
              ),
              title: Text(controla.listaArticlesFinal![index].detalle),
              subtitle: Text(controla.listaArticlesFinal![index].codigo),
              trailing: (controla.listaArticlesFinal![index].idUser ==
                      controlu.listaUserLogin![0].id)
                  ? IconButton(
                      onPressed: () {
                        controla.listaArticlesFinal![0].idice = index;
                        Get.toNamed("/editArticle");
                        print(index);
                      },
                      icon: Icon(Icons.edit))
                  : const Text(""),
              onTap: () {
                controla
                    .deleteArticle(
                        controla.listaArticlesFinal![index].id.toString())
                    .then((value) {
                  Get.snackbar('Clientes', controla.listaMensajes![0].mensaje,
                      duration: const Duration(seconds: 3),
                      icon: const Icon(Icons.info),
                      shouldIconPulse: true,
                      backgroundColor: Color.fromARGB(255, 5, 47, 161));
                      controla.listArticlesId(controlu.listaUserLogin![0].id.toString());
                      controla.listaArticle.refresh();
                });
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/addArticle");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
