import 'package:app_compras/view/food/recommended_food_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_compras/helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    home: RecommendedFoodView(),
  ));
}
