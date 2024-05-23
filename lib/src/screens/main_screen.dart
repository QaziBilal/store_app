import 'package:flutter/material.dart';
import 'package:store/src/helper/sizedbox_extension.dart';
import 'package:store/src/helper/utils/routes_name.dart';
import 'package:store/src/screens/homepage.dart';
import 'package:store/src/screens/onboardings_screen.dart';
import 'package:store/src/widgets/button.dart';
import 'package:store/src/widgets/custom_text.dart';

import '../helper/constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    double sh = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
              child: Image.asset(
            AppImages.mainBackground,
            fit: BoxFit.cover,
            width: sw,
            height: sh,
            opacity: const AlwaysStoppedAnimation(.4),
          )),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: AppColors.mainColor,
                  child: Center(
                    child: Image.asset(
                      AppImages.logo3,
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                      color: Colors.white,
                    ),
                  ),
                ),
                30.height,
                customText(context, "Welcome",
                    fontWeight: FontWeight.w700, size: 35),
                30.height,
                customText(context, "Fresh Products\nAvailable at any time",
                    size: 16),
                35.height,
                CustomElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteName.homePage);
                    },
                    buttonText: "Try Now",
                    isEnabled: false,
                    width: sw * 0.8,
                    color: AppColors.mainColor),
                15.height,
                CustomElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteName.onboardingScreen);
                    },
                    buttonText: "Onboarding",
                    isEnabled: false,
                    width: sw * 0.8,
                    color: AppColors.darkGreen),
                15.height,
                CustomElevatedButton(
                    onPressed: () {},
                    buttonText: "Login",
                    isEnabled: true,
                    width: sw * 0.8,
                    color: AppColors.mainColor)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
