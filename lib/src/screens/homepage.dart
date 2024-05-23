import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/src/controller/cartController.dart';
import 'package:store/src/helper/constants.dart';
import 'package:store/src/helper/sizedbox_extension.dart';
import 'package:store/src/screens/cart_screen.dart';
import 'package:store/src/screens/home_screen.dart';
import 'package:store/src/screens/setting_screen.dart';
import 'package:store/src/screens/wishlist_screen.dart';
import 'package:store/src/widgets/custom_appbar.dart';

import '../widgets/custom_text.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  int newindex;
  HomePage({this.newindex = 0, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentIndex = widget.newindex;
    });
  }

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(sw, 50),
        child: const CustomAppbar(
          check: true,
        ),
      ),
      body: _getBody(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.mainColor,
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              size: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Stack(clipBehavior: Clip.none, children: [
              Icon(
                Icons.shopping_cart,
                size: 24,
              ),
              Consumer<CartController>(
                  builder: (context, value, child) => Positioned(
                        left: 25,
                        child: customText(context, "${value.cartList.length}",
                            size: 14, color: AppColors.mainColor),
                      ))
            ]),
            label: 'cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 24,
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 24,
            ),
            label: 'Setting',
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.mainColor,
        child: Column(
          children: [
            50.height,
            ListTile(
              minLeadingWidth: 0,
              leading: const Icon(
                Icons.share,
                color: Colors.white,
              ),
              title: customText(context, "Signin",
                  size: 20,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w500),
            ),
            ListTile(
              minLeadingWidth: 0,
              leading: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: customText(context, "Welcome",
                  fontWeight: FontWeight.w500,
                  size: 20,
                  textAlign: TextAlign.left),
            ),
            const Spacer(),
            Image.asset(
              AppImages.logo3,
              width: 100,
              height: 100,
              color: Colors.white,
            ),
            40.height
          ],
        ),
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const CartScreen();
      case 2:
        return const WishListScreen();
      case 3:
        return const SettingScreen();
      default:
        return const Center(child: Text('Invalid Page'));
    }
  }
}
