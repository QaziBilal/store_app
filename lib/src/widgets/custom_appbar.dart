import 'package:flutter/material.dart';
import 'package:store/src/helper/constants.dart';
import 'package:store/src/helper/utils/routes_name.dart';

class CustomAppbar extends StatelessWidget {
  final check;
  const CustomAppbar({this.check = false, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: AppColors.mainColor,
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: InkWell(
        onTap: () {
          // Navigator.popUntil(
          //     context, (route) => route.settings.name == RouteName.homePage);
          Navigator.pushNamedAndRemoveUntil(
              context, RouteName.homePage, (route) => false);
          // Navigator.pushNamed(context, RouteName.homePage, arguments: 0);
        },
        child: SizedBox(
          child: Image.asset(
            AppImages.logo3,
            width: 40,
            height: 40,
            fit: BoxFit.contain,
            color: check == false ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}
