import 'package:flutter/material.dart';
import 'package:store/src/helper/utils/routes_name.dart';
import 'package:store/src/screens/main_screen.dart';

import '../helper/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, RouteName.mainScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
          child: Center(
        child: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              child: Image.asset(
                AppImages.logo3,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 170,
              height: 170,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 12,
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
