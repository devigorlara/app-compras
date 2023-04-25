import 'package:app_compras/data/repository/recommended_repo.dart';
import 'package:app_compras/models/api_response.dart';
import 'package:get/get.dart';

class RecommendedController extends GetxController {
  RecommendedRepo recommendedRepo = Get.put(RecommendedRepo(apiClient: Get.find()));

  List<dynamic> _recommendedProductList = [];
  
  List<dynamic> get recommendedProductList => _recommendedProductList;
  @override
  void onInit(){
    getRecommendedProductList();
    super.onInit();
  }
  Future<void> getRecommendedProductList() async {
    ApiResponse response = await recommendedRepo.getRecommendedProductList();
    //print(response.data);
    _recommendedProductList.addAll(response.data as List<dynamic>);
    update();
  }
}
