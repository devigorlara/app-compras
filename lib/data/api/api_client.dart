import 'package:app_compras/global/constant/api_constant.dart';
import 'package:app_compras/data/models/api_response.dart';
import 'package:app_compras/data/models/products_model.dart';
import 'package:app_compras/data/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  /*Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }*/

  Future<ApiResponse> login(String email, String password) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.post(Uri.parse(ApiConstants.loginURL),
          headers: {'Accept': 'application/json'},
          body: {'email': email, 'password': password});
      switch (response.statusCode) {
        case 200:
          apiResponse.data = User.fromJson(jsonDecode(response.body));
          break;
        case 422:
          final errors = jsonDecode(response.body)['errors'];
          apiResponse.error = errors[errors.keys.elementAt(0)][0];
          break;
        case 403:
          apiResponse.error = jsonDecode(response.body)['message'];
          break;
        default:
          apiResponse.error = ApiConstants.serverError;
          break;
      }
    } catch (e) {
      apiResponse.error = ApiConstants.somethingWentWrong;
    }
    return apiResponse;
  }

  Future<ApiResponse> getAllProducts() async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final response = await http.get(Uri.parse(ApiConstants.productsURL),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read('token')}'
          });

      switch (response.statusCode) {
        case 200:
          //print("entrei aq2");
          apiResponse.data = jsonDecode(response.body)['products']
              .map((p) => Products.fromJson(p))
              .toList();

          apiResponse.data as List<dynamic>;
          break;
        case 401:
          apiResponse.error = ApiConstants.unauthorized;

          break;
        default:
          apiResponse.error = ApiConstants.somethingWentWrong;

          break;
      }
    } catch (e) {
      apiResponse.error = ApiConstants.serverError;
    }

    return apiResponse;
  }
  Future<ApiResponse> getPopularList() async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final response = await http.get(Uri.parse(ApiConstants.popularURL),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read('token')}'
          });
      switch (response.statusCode) {
        case 200:
          apiResponse.data = jsonDecode(response.body)['products']
              .map((p) => Products.fromJson(p))
              .toList();
          apiResponse.data as List<dynamic>;
          break;
        case 401:
          apiResponse.error = ApiConstants.unauthorized;

          break;
        default:
          apiResponse.error = ApiConstants.somethingWentWrong;

          break;
      }
    } catch (e) {
      apiResponse.error = ApiConstants.serverError;
    }

    return apiResponse;
  }
  Future<ApiResponse> getRecommendedList() async {
    ApiResponse apiResponse = ApiResponse();

    try {
      print('/${box.read('user_id')}');
      final response = await http.get(Uri.parse(ApiConstants.recommendedURL + '/${box.read('user_id')}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read('token')}'
          });
      switch (response.statusCode) {
        case 200:
          apiResponse.data = jsonDecode(response.body)['products']
              .map((p) => Products.fromJson(p))
              .toList();

          apiResponse.data as List<dynamic>;
          break;
        case 401:
          apiResponse.error = ApiConstants.unauthorized;

          break;
        default:
          apiResponse.error = ApiConstants.somethingWentWrong;

          break;
      }
    } catch (e) {
      apiResponse.error = ApiConstants.serverError;
    }

    return apiResponse;
  }
}
