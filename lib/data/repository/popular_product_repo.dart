import 'package:app_compras/data/api/api_client.dart';
import 'package:app_compras/data/models/api_response.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<ApiResponse> getPopularProductList() async {
    return await apiClient.getPopularList();
  }
}
