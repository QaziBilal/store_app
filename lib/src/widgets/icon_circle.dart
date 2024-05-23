import 'package:flutter/material.dart';
import 'package:store/src/helper/sizedbox_extension.dart';
import 'package:store/src/widgets/custom_text.dart';

Widget iconCircle(context, Color color, icon, name, {bool check = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        backgroundColor: color,
        radius: 25,
        child: Center(
          child: Image.asset(
            icon,
            width: 20,
            height: 20,
            color: Colors.white,
          ),
        ),
      ),
      10.width,
      customText(context, name,
          size: 23, color: check == true ? color : Colors.white)
    ],
  );
}
