import 'package:app_compras/constant/api_constant.dart';
import 'package:app_compras/controllers/login_controller.dart';
import 'package:app_compras/controllers/popular_product_controller.dart';
import 'package:app_compras/controllers/product_controller.dart';
import 'package:app_compras/data/api/api_client.dart';
import 'package:app_compras/data/repository/popular_product_repo.dart';
import 'package:app_compras/data/repository/product_repo.dart';
import 'package:app_compras/data/repository/user_repo.dart';

import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies(){
    Get.put<ApiClient>(ApiClient());
    Get.put<UserRepo>(UserRepo(apiClient: Get.find()));
    Get.put<ProductRepo>(ProductRepo(apiClient: Get.find()));
    Get.put<ProductController>(ProductController());
    Get.put<LoginController>(LoginController());
  }
}
