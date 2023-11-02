import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practicalMap/listScreen/appResponsemodelAdpter.dart';
import 'package:practicalMap/routes/app_pages.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AppResponseModelAdapter());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPages.initial,
    getPages: AppPages.routes,
    title: "Map Demo",
  ));
}
