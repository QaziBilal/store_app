import 'package:flutter/material.dart';
import 'package:store/src/helper/utils/routes_name.dart';
import 'package:store/src/models/category_model.dart';
import 'package:store/src/screens/detail_screen.dart';
import 'package:store/src/screens/home_screen.dart';
import 'package:store/src/screens/homepage.dart';
import 'package:store/src/screens/main_screen.dart';
import 'package:store/src/screens/onboardings_screen.dart';
import 'package:store/src/screens/products_screen.dart';
import 'package:store/src/screens/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RouteName.homePage:
        var args = settings.arguments;
        if (args == 1) {
          return MaterialPageRoute(
              builder: (context) => HomePage(newindex: args as int));
        } else {
          return MaterialPageRoute(builder: (context) => HomePage());
        }

      case RouteName.onboardingScreen:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      case RouteName.mainScreen:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case RouteName.productScreen:
        var args = settings.arguments;
        if (args is CategoryModel) {
          return MaterialPageRoute(
              builder: (context) => ProductsScreen(
                    categoryModel: args,
                  ));
        } else {
          return MaterialPageRoute(builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("No route Defined"),
              ),
            );
          });
        }
      case DetailScreen.route:
        var args = settings.arguments;
        if (args is Map<String, dynamic> &&
            args.containsKey('productModel') &&
            args.containsKey('categoryModel')) {
          return MaterialPageRoute(
            builder: (context) => DetailScreen(
              productModel: args['productModel'],
              categoryModel: args['categoryModel'],
            ),
          );
        } else {
          return MaterialPageRoute(builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("No route Defined"),
              ),
            );
          });
        }
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text("No route Defined"),
            ),
          );
        });
    }
  }
}
