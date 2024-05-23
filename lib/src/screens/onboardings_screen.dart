import 'package:flutter/material.dart';
import 'package:store/src/helper/constants.dart';
import 'package:store/src/helper/sizedbox_extension.dart';
import 'package:store/src/screens/homepage.dart';
import 'package:store/src/widgets/button.dart';
import 'package:store/src/widgets/custom_appbar.dart';
import 'package:store/src/widgets/custom_text.dart';

import '../helper/utils/routes_name.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    double sh = MediaQuery.sizeOf(context).height;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(sw, 40),
            child: CustomAppbar(
              check: true,
            )),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              SizedBox(
                height: sh * 0.7,
                child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: onPageChanged,
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            left: 40, right: 40, top: 20, bottom: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.mainColor.withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 2)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 40, bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                    AppImages.logo3,
                                    height: 40,
                                    width: 40,
                                  )),
                              Image.asset(
                                images[index],
                                width: sw * 0.7,
                                height: sw * 0.4,
                                fit: BoxFit.contain,
                              ),
                              20.height,
                              customText(context, titles[index],
                                  color: AppColors.mainColor, size: 20),
                              Spacer(),
                              if (index == 2)
                                CustomElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, RouteName.homePage);
                                    },
                                    buttonText: "Enter Now!",
                                    isEnabled: false,
                                    width: sw * 0.4,
                                    color: AppColors.darkGreen),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Spacer(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => Container(
                          margin: EdgeInsets.only(left: 20),
                          clipBehavior: Clip.none,
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? AppColors.mainColor.withOpacity(0.3)
                                : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.mainColor.withOpacity(0.1)),
                          ),
                          child: Center(
                            child: CircleAvatar(
                              radius: 4,
                              backgroundColor: AppColors.mainColor,
                            ),
                          )))),
              Spacer(),
              CustomElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.homePage);
                  },
                  buttonText: "Try Now!",
                  isEnabled: false,
                  width: sw * 0.4,
                  color: AppColors.mainColor),
            ],
          ),
        ));
  }
}

List images = [
  AppImages.onboarding1,
  AppImages.onboarding2,
  AppImages.onboarding3,
];

List titles = [
  "Fresh Products from the land to your table",
  "Fresh and healthy meats and sausages for your delight",
  "Buy them from the comfort of your mobile Device"
];
