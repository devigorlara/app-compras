import 'package:app_compras/data/api/api_client.dart';
import 'package:app_compras/models/api_response.dart';
import 'package:get/get.dart';

class ProductRepo extends GetxService {
  final ApiClient apiClient;

  ProductRepo({required this.apiClient});

  Future<ApiResponse> getAll() async {
    final response = await apiClient.getAllProducts();
    return response;
  }
}
