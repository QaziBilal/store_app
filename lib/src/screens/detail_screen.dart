import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/src/controller/cartController.dart';
import 'package:store/src/helper/constants.dart';
import 'package:store/src/helper/sizedbox_extension.dart';
import 'package:store/src/helper/utils/routes_name.dart';
import 'package:store/src/models/category_model.dart';
import 'package:store/src/models/product_model.dart';
import 'package:store/src/widgets/custom_appbar.dart';
import 'package:store/src/widgets/custom_text.dart';

import '../models/meatModel.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  static const String route = 'detail_screen';

  ProductModel productModel;
  CategoryModel categoryModel;
  DetailScreen(
      {required this.productModel, required this.categoryModel, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int index = 0;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    double sh = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: sw,
            height: sh * 0.35,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(50)),
              image: DecorationImage(
                  image: AssetImage(
                    widget.productModel.image,
                  ),
                  fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                const CustomAppbar(),
                Positioned(
                  top: 100,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.mainColor,
                    ),
                    child: Consumer<CartController>(
                        builder: (context, value, child) {
                      print("Chicken cart");

                      return Row(
                        children: [
                          customText(context, "${value.cartList.length}"),
                          3.width,
                          const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 15,
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                Positioned(
                    bottom: 30,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: widget.categoryModel.color,
                          radius: 20,
                          child: Center(
                            child: Image.asset(
                              widget.categoryModel.icon,
                              color: Colors.white,
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            customText(context, widget.productModel.name,
                                size: 15),
                            10.height,
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: widget.categoryModel.color,
                              ),
                              child: customText(
                                  context, "${widget.productModel.price}/Kg",
                                  size: 13),
                            ),
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
          if (widget.productModel.productImagelist != null) ...[
            SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.productModel.productImagelist!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedIndex == index) {
                            selectedIndex = -1; // Deselect if already selected
                          } else {
                            selectedIndex = index;
                          }
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: [
                              Colors.white,
                              Colors.black.withOpacity(0.3)
                            ])),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: selectedIndex == index
                                          ? AppColors.meat
                                          : Colors.white,
                                      width: selectedIndex == index ? 6 : 0),
                                  borderRadius: BorderRadius.circular(20)),
                              margin: EdgeInsets.all(8.0),
                              width: 100,
                              height: 100,
                              child: Image.asset(meat[index].image),
                            ),
                            customText(context, meat[index].name,
                                size: 13, color: AppColors.meat)
                          ],
                        ),
                      ),
                    );
                  },
                ))
          ] else ...[
            30.height,
          ],
          RichText(
            text: const TextSpan(children: [
              TextSpan(
                text: 'Unit ',
                style: TextStyle(fontFamily: 'Raleway', color: Colors.black),
              ),
              TextSpan(
                text: 'Kg. ',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              TextSpan(
                text: '(max. 20)',
                style: TextStyle(fontFamily: 'Raleway', color: Colors.black),
              ),
            ]),
          ),
          10.height,
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            width: sw * 0.9,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<CartController>(builder: (context, value, child) {
                  print("Value increased");

                  return InkWell(
                    onTap: () {
                      value.updateQuantity(true);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: value.quantity != 21
                                  ? widget.categoryModel.color
                                  : Colors.grey,
                              width: 2),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.add,
                        color: index != 20
                            ? widget.categoryModel.color
                            : Colors.grey,
                      ),
                    ),
                  );
                }),
                Consumer<CartController>(builder: (context, value, child) {
                  print("Value decresased");
                  return RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "${value.quantity}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const TextSpan(
                      text: ' (Kg.)',
                      style:
                          TextStyle(fontFamily: 'Raleway', color: Colors.black),
                    ),
                  ]));
                }),
                Consumer<CartController>(builder: (context, value, child) {
                  print("Value .quant");

                  return InkWell(
                    onTap: () {
                      value.updateQuantity(false);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          shape: BoxShape.circle),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.grey,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          10.height,
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "price",
                    style:
                        TextStyle(color: Colors.black, fontFamily: "Raleway"),
                  ),
                  TextSpan(
                    text: '\$${widget.productModel.price} / Kg',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ])),
                Consumer<CartController>(
                  builder: (context, value, child) => customText(context,
                      "\$${value.quantity * widget.productModel.price}",
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      size: 17),
                )
              ],
            ),
          ),
          const Spacer(),
          Consumer<CartController>(
            builder: (context, value, child) => buttonColor(
                sw, AppColors.mainColor, Icons.shopping_cart, "Add to Cart",
                () {
              value.setCartListItems(widget.productModel, index);

              Navigator.pushReplacementNamed(context, RouteName.homePage,
                  arguments: 1);
            }),
          ),
          10.height,
          buttonColor(sw, AppColors.darkGreen, Icons.location_on,
              "Product Location", () {}),
          20.height
        ],
      ),
    );
  }

  Widget buttonColor(double sw, Color color, IconData icon, text, onPressed) {
    return ElevatedButton(
      onPressed: onPressed, // Add your onPressed function here
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Set the button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(55),
        ),
      ),
      child: Container(
        width: sw * 0.8,
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 25,
              color: Colors.white,
            ),
            const SizedBox(width: 10), // Used SizedBox for spacing
            customText(context, text, size: 15, fontWeight: FontWeight.w600),
          ],
        ),
      ),
    );
  }
}
