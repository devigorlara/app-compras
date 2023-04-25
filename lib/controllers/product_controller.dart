import 'package:app_compras/data/repository/product_repo.dart';
import 'package:app_compras/models/api_response.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductRepo productRepo = Get.find<ProductRepo>();
  List<dynamic> productList = [];
  Future<void> getAll() async {
    final ApiResponse response = await productRepo.getAll();
    productList = response.data as List<dynamic>;
    print(productList.length);
  }
}
