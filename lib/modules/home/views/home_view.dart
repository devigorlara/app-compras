import 'package:app_compras/global/widgets/text.dart';
import 'package:app_compras/global/constant/colors.dart';
import 'package:app_compras/global/utilities/dimensions.dart';
import 'package:app_compras/modules/home/views/food_body_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  bottom: Dimensions.height20, top: Dimensions.height10),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      bigText('Paraná', color: AppColors.mainColor),
                      Row(
                        children: [
                          smallText("Toledo",
                              color: AppColors.blackColorWithOpacity),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            size: Dimensions.width15,
                          )
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      height: Dimensions.height45,
                      width: Dimensions.height45,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.width15),
                          color: Color(0xFF89dad0)),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.iconSize24,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(child: SingleChildScrollView(child: FoodBodyView())),
          ],
        ),
      ),
    );
  }
}
