import 'package:app_compras/controllers/product_controller.dart';
import 'package:app_compras/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_compras/bindings/dependencies.dart' as dep;
import 'package:app_compras/constant/route.dart';
import 'package:app_compras/view/auth/login_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  //Get.find<PopularProductController>().getPopularProductList();
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: LoginView(),
      initialBinding: dep.InitBinding(),
      routes: {
        loginRoute: (context) => LoginView(),
      }));
}

