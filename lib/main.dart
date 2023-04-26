import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:app_compras/helper/dependencies.dart' as dep;
import 'package:app_compras/global/constant/route.dart';
import 'package:app_compras/modules/login/views/login_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  //Get.find<PopularProductController>().getPopularProductList();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: LoginView(),
      initialBinding: dep.InitBinding(),
      getPages: getPages,
    ),
  );
}

