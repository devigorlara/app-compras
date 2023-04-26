import 'package:app_compras/data/models/products_model.dart';
import 'package:app_compras/data/repository/popular_product_repo.dart';
import 'package:app_compras/data/models/api_response.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  PopularProductRepo popularProductRepo = Get.put(PopularProductRepo(apiClient: Get.find()));

  List<dynamic> _popularProductList = [];
  int index = 0;
  RxInt quant = 0.obs;
  RxDouble total = 0.0.obs;
  List<dynamic> get popularProductList => _popularProductList;
  @override
  void onInit(){
    getPopularProductList();
    super.onInit();
  }
  Future<void> getPopularProductList() async {
    ApiResponse response = await popularProductRepo.getPopularProductList();
    //print(response.data);
    _popularProductList.addAll(response.data as List<dynamic>);
    update();
  }
  void setIndex(int i){
    index = i;
  }
  void incrementQuant(){
    quant.value++;
    priceTotal();
  }
  void decrementQuant(){
    quant.value--;
    priceTotal();
  }
  void priceTotal(){
    Products product = _popularProductList[index];
    total.value = double.parse('${product.price}') * quant.value.toDouble();
  }
}
