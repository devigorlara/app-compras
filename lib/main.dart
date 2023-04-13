import 'package:app_compras/view/food/recommended_food_detail.dart';
import 'package:app_compras/view/home_view.dart';
import 'package:app_compras/view/food/popular_food_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    home: RecommendedFoodView(),
  ));
}
