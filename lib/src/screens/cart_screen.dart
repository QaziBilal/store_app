import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/src/controller/cartController.dart';
import 'package:store/src/helper/sizedbox_extension.dart';
import 'package:store/src/helper/utils/routes_name.dart';
import 'package:store/src/widgets/custom_text.dart';
import '../helper/constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.sizeOf(context).height;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, RouteName.homePage);
        return true;
      },
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 30, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: AppColors.mainColor,
                        size: 30,
                      ),
                      8.width,
                      customText(context, "Your Cart",
                          fontWeight: FontWeight.w600,
                          size: 20,
                          color: Colors.grey),
                    ],
                  ),
                  Consumer<CartController>(builder: (context, value, child) {
                    if (value.cartList.length != 0) {
                      return InkWell(
                        onTap: () {
                          value.clearList();
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 7, bottom: 7),
                          decoration: BoxDecoration(
                              color: AppColors.mainColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: AppColors.darkGreen,
                              ),
                              customText(context, "Delete All",
                                  size: 16, color: AppColors.darkGreen)
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  })
                ],
              ),
            ),
            Consumer<CartController>(builder: (context, value, child) {
              if (value.cartList.isNotEmpty) {
                return SizedBox(
                  height: sh * 0.65,
                  child: ListView.builder(
                      itemCount: value.cartList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(
                              bottom: 20, left: 20, right: 20),
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 5)
                              ]),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  value.cartList[index].productModel.image,
                                ),
                              ),
                              20.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customText(context,
                                      value.cartList[index].productModel.name,
                                      color: AppColors.meat, size: 13),
                                  customText(context,
                                      "${value.cartList[index].quantity} /Kg",
                                      size: 13, color: Colors.black),
                                  customText(context,
                                      "\$${value.cartList[index].quantity * value.cartList[index].productModel.price}",
                                      color: AppColors.meat,
                                      size: 14,
                                      fontWeight: FontWeight.w600)
                                ],
                              ),
                              const Spacer(),
                              Consumer<CartController>(
                                builder: (context, value, child) => InkWell(
                                  onTap: () {
                                    value.removeCartItem(value.cartList[index]);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.highLightDefault,
                                            width: 2),
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.close,
                                      color: AppColors.highLightDefault,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                );
              } else {
                return Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: sh * 0.7,
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset(
                            AppImages.logo3,
                            width: 100,
                            height: 100,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 100,
                            child: VerticalDivider(
                              color: Colors.grey,
                              width: 10,
                            ),
                          ),
                          Expanded(
                            child: customText(context,
                                "Your Cart is Empty right Now, Choose Produts!",
                                size: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
            }),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    AppImages.logo3,
                    width: 40,
                    height: 40,
                  ),
                  Consumer<CartController>(
                    builder: (context, value, child) => customText(
                        context, "Total \$${value.getTotalPrice()}",
                        color: AppColors.mainColor,
                        size: 24,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
