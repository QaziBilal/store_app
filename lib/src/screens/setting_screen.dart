import 'package:flutter/material.dart';
import 'package:store/src/helper/constants.dart';
import 'package:store/src/helper/sizedbox_extension.dart';

import '../widgets/custom_text.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
                  Icons.settings,
                  color: AppColors.mainColor,
                  size: 30,
                ),
                8.width,
                customText(context, "Setting",
                    fontWeight: FontWeight.w600, size: 20, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
