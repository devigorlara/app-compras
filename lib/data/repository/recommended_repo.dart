import 'package:app_compras/data/api/api_client.dart';
import 'package:app_compras/models/api_response.dart';
import 'package:get/get.dart';

class RecommendedRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedRepo({required this.apiClient});

  Future<ApiResponse> getRecommendedProductList() async {
    return await apiClient.getRecommendedList();
  }
}