import 'package:flutter/material.dart';

import '../helper/constants.dart';

class CustomTagWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final int index;

  const CustomTagWidget({
    Key? key,
    required this.onTap,
    required this.text,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.mainColor),
        ),
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
