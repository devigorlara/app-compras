import 'package:app_compras/controllers/popular_product_controller.dart';
import 'package:app_compras/data/api/api_client.dart';
import 'package:app_compras/data/repository/popular_product_repo.dart';

import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: "appBaseUrl"));

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
