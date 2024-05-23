import 'package:flutter/material.dart';
import 'package:store/src/helper/dummy_data.dart';
import 'package:store/src/helper/sizedbox_extension.dart';
import 'package:store/src/widgets/custom_text.dart';
import 'package:store/src/widgets/icon_circle.dart';

import '../helper/utils/routes_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    double sh = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          customText(context, "Select Category", size: 15, color: Colors.black),
          10.height,
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                itemCount: categoriesList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.productScreen,
                          arguments: categoriesList[index]);
                    },
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      height: sh * 0.2,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Stack(
                        children: [
                          Image.asset(
                            categoriesList[index].image,
                            fit: BoxFit.cover,
                            height: sh * 0.2,
                            width: sw,
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.8),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 20,
                              left: 20,
                              child: iconCircle(
                                  context,
                                  categoriesList[index].color,
                                  categoriesList[index].icon,
                                  categoriesList[index].name))
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
