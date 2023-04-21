import 'package:crud_http_articulos/ui/app.dart';
import 'package:flutter/material.dart';
import 'domain/controller/controllerArticles.dart';
import 'domain/controller/controllerUser.dart';
import 'package:get/get.dart';

void main() {
  Get.put(ControlUser());
  Get.put(ControlArticles());
  runApp(const App());
}
