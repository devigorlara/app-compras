import 'package:app_compras/global/constant/colors.dart';
import 'package:app_compras/data/models/products_model.dart';
import 'package:app_compras/global/utilities/dimensions.dart';
import 'package:app_compras/global/widgets/app_icon.dart';
import 'package:app_compras/global/widgets/expandable_text.dart';
import 'package:app_compras/global/widgets/text.dart';
import 'package:app_compras/modules/recommended/controllers/recommended_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedFoodView extends GetView<RecommendedController> {
  
  @override
  Widget build(BuildContext context) {
    final Products product = controller.recommendedProductList[controller.index];
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: Dimensions.height80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.reset();
                    Get.back();
                  },
                  child: appIcon(Icons.clear)
                ),
                appIcon(
                  Icons.shopping_cart_outlined,
                )
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                child: Center(
                    child: bigText("${product.name}", size: Dimensions.font26)),
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Color.fromARGB(255, 248, 200, 67),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/food2.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: ExpandableText(
                    text:
                        '${product.description}',
                  ),
                ),
              ],
            )),
          )
        ]),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      controller.decrementQuant();
                    },
                    child: appIcon(
                      Icons.remove,
                      backgroundColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Obx(() => bigText("\$ ${product.price} X ${controller.quant.value}",
                        size: Dimensions.font26,
                        color: AppColors.mainBlackColor),)
                  ),
                  InkWell(
                    onTap: () {
                      controller.incrementQuant();
                    },
                    child: appIcon(
                      Icons.add,
                      backgroundColor: AppColors.mainColor,
                      iconColor: Colors.white,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Dimensions.height110,
              decoration: BoxDecoration(
                color: AppColors.buttonBackgroudColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20),
                ),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.height20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Dimensions.height60,
                      height: Dimensions.height60,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                        size: Dimensions.iconSize24,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Obx(() => bigText("\$ ${controller.total.value} | Add to cart",
                          size: Dimensions.font26, color: Colors.white),),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
