import 'package:app_compras/data/models/products_model.dart';
import 'package:app_compras/data/repository/popular_product_repo.dart';
import 'package:app_compras/data/models/api_response.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  PopularProductRepo popularProductRepo = Get.put(PopularProductRepo(apiClient: Get.find()));

  List<dynamic> _popularProductList = [];

  RxInt quant = 1.obs;
  RxDouble total = 0.0.obs;
  RxDouble price_item = 0.0.obs;
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
  void setTotal(double total_price){
    price_item.value = total_price;
    total.value = price_item.value;
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
    print(quant.value.toDouble());
    total.value =  price_item * quant.value.toDouble();
  }
  void reset(){
    quant.value = 0;
  }
}
