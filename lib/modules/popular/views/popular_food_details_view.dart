import 'package:app_compras/data/models/products_model.dart';
import 'package:app_compras/global/constant/colors.dart';
import 'package:app_compras/global/constant/route.dart';
import 'package:app_compras/global/utilities/dimensions.dart';
import 'package:app_compras/global/widgets/app_icon.dart';
import 'package:app_compras/global/widgets/column_details_food.dart';
import 'package:app_compras/global/widgets/expandable_text.dart';
import 'package:app_compras/global/widgets/text.dart';
import 'package:app_compras/modules/popular/controllers/popular_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularFoodDetailsView extends GetView<PopularProductController>{
  final Products product;

  PopularFoodDetailsView(this.product);

  @override
  Widget build(BuildContext context) {
    controller.setTotal(double.parse('${product.price}'));
    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
              automaticallyImplyLeading: false,
            ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/food1.jpg"),
                  fit: BoxFit.cover,
                )),
              ),
            ),
            Positioned(
              top: Dimensions.height20,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap:() { 
                      Get.back();
                      controller.reset();
                    },
                    child: appIcon(Icons.arrow_back_ios)),
                  appIcon(Icons.shopping_cart_checkout_outlined)
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - Dimensions.height20,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width20,
                    vertical: Dimensions.width20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    columnDetailsFood("${product.name}",
                        sizeLabel: Dimensions.font26),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    bigText("Introduce"),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableText(
                            text:
                                '${product.description}'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
          decoration: BoxDecoration(
            color: AppColors.buttonBackgroudColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height20,
                    horizontal: Dimensions.width20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap:() {
                        controller.decrementQuant();
                      },
                      child: Icon(
                        Icons.remove,
                        color: AppColors.signColor,
                      ),
                    ),
                    SizedBox(width: Dimensions.width10 / 2),
                    Obx(() => bigText("${controller.quant.value}")),
                    SizedBox(width: Dimensions.width10 / 2),
                    GestureDetector(
                      onTap:() {
                        controller.incrementQuant();
                      },
                      child: Icon(
                        Icons.add,
                        color: AppColors.signColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width10,
                    vertical: Dimensions.width20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor,
                ),
                child: Obx(() => bigText("\$ ${controller.total.value} | Add to cart", color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
