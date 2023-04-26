import 'package:app_compras/modules/login/views/login_view.dart';
import 'package:app_compras/modules/recommended/views/recommended_food_detail.dart';
import 'package:app_compras/modules/register/views/register_view.dart';
import 'package:app_compras/modules/popular/views/popular_food_details_view.dart';
import 'package:app_compras/modules/home/views/home_view.dart';
import 'package:get/get.dart';

class Routes{
  static const loginRoute = '/login';
  static const registerRoute = '/register';
  static const homeRoute = '/home';
  static const loggedRoute = '/logged';
  static const popularFoodDetailsRoute = '/popular';
  static const recommendedFoodDetailsRoute = '/recommended';
}
final getPages = [
  GetPage(
    name: Routes.loginRoute,
    page: () => LoginView(),
  ),
  GetPage(
    name: Routes.registerRoute,
    page: () => RegisterView(),
  ),
  GetPage(
    name: Routes.homeRoute,
    page: () => HomeView(),
  ),
  /*GetPage(
    name: Routes.popularFoodDetailsRoute,
    page: () => PopularFoodDetailsView(),
  ),*/
  GetPage(
    name: Routes.recommendedFoodDetailsRoute,
    page: () => RecommendedFoodView(),
  ),
];