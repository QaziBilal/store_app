import 'package:flutter/material.dart';

import '../helper/constants.dart';
import 'custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final bool isEnabled;
  final double width;
  final Color color;

  CustomElevatedButton(
      {required this.onPressed,
      required this.buttonText,
      required this.isEnabled,
      required this.width,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled == false ? color : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(55),
          side:
              isEnabled ? BorderSide(color: color, width: 4) : BorderSide.none,
        ),
      ),
      child: Container(
        width: width,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Center(
          child: customText(context, buttonText,
              size: 15, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
