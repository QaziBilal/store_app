import 'package:flutter/material.dart';
import 'package:store/src/helper/sizedbox_extension.dart';
import 'package:store/src/helper/utils/routes_name.dart';
import 'package:store/src/models/category_model.dart';
import 'package:store/src/screens/detail_screen.dart';
import 'package:store/src/widgets/custom_appbar.dart';
import 'package:store/src/widgets/custom_text.dart';
import 'package:store/src/widgets/icon_circle.dart';

import '../helper/constants.dart';

class ProductsScreen extends StatelessWidget {
  CategoryModel categoryModel;
  ProductsScreen({required this.categoryModel, super.key});

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(preferredSize: Size(sw, 40), child: CustomAppbar()),
      body: Column(
        children: [
          10.height,
          Align(
            alignment: Alignment.center,
            child: iconCircle(context, categoryModel.color, categoryModel.icon,
                categoryModel.name,
                check: true),
          ),
          30.height,
          Expanded(
            child: GridView.builder(
                itemCount: categoryModel.productModel.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, DetailScreen.route,
                          arguments: {
                            'productModel': categoryModel.productModel[index],
                            'categoryModel': categoryModel
                          });
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                              categoryModel.productModel[index].image),
                        ),
                        10.height,
                        customText(
                            context, categoryModel.productModel[index].name,
                            color: categoryModel.color, size: 15)
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
