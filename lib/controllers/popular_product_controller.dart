import 'package:app_compras/data/repository/popular_product_repo.dart';
import 'package:app_compras/models/api_response.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  PopularProductRepo popularProductRepo = Get.put(PopularProductRepo(apiClient: Get.find()));

  List<dynamic> _popularProductList = [];
  
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
}
