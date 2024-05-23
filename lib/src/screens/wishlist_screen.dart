import 'package:flutter/material.dart';
import 'package:store/src/helper/constants.dart';
import 'package:store/src/helper/sizedbox_extension.dart';
import 'package:store/src/widgets/custom_text.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: AppColors.mainColor,
                  size: 30,
                ),
                8.width,
                customText(context, "Favourite",
                    fontWeight: FontWeight.w600, size: 20, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
