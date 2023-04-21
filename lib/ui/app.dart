import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/login.dart';
import 'auth/register.dart';
import 'content/articles/addArticles.dart';
import 'content/articles/editArticle.dart';
import 'content/articles/listarticles.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crud Usando HTTP',
      theme: ThemeData(primarySwatch: Colors.amber),
      initialRoute: '/login',
      routes: {
        "/login": (context) => const Login(),
        "/register": (context) => const Register(),
        "/listarticles": (context) => const ListArticles(),
        "/addArticle": (context) => const AddArticle(),
        "/editArticle": (context) => const EditArticle(),
      },
    );
  }
}
