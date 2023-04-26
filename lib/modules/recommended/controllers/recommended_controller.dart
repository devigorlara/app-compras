import 'package:app_compras/data/models/products_model.dart';
import 'package:app_compras/data/repository/recommended_repo.dart';
import 'package:app_compras/data/models/api_response.dart';
import 'package:get/get.dart';

class RecommendedController extends GetxController {
  RecommendedRepo recommendedRepo = Get.put(RecommendedRepo(apiClient: Get.find()));

  List<dynamic> _recommendedProductList = [];
  
  int index = 0;
  RxInt quant = 1.obs;
  RxDouble total = 0.0.obs;
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
  void setIndex(int i){
    index = i;
  }
  void incrementQuant(){
    quant++;
    priceTotal();
  }
  void decrementQuant(){
    if(quant.value > 1) quant--;
    priceTotal();
  }
  void priceTotal(){
    Products product = _recommendedProductList[index];
    total.value = double.parse('${product.price}') * quant.value.toDouble();
  }
  void reset(){
    quant.value = 1;
    total.value = 0.0;
  }
}
