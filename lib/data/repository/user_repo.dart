import 'package:app_compras/global/constant/api_constant.dart';
import 'package:app_compras/data/api/api_client.dart';
import 'package:app_compras/data/models/api_response.dart';
import 'package:get/get.dart';

class UserRepo extends GetxService {
  final ApiClient apiClient;

  UserRepo({required this.apiClient});

  Future<ApiResponse> loginUser(String email, String password) async {
    final response = await apiClient.login(email, password);
    return response;
  }
}
