import 'package:flutter/material.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  const MyTextfield({
    super.key,
    required this.hintText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: MyColors.black.withOpacity(0.1),
            blurRadius: 35,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              prefixIcon,
              color: MyColors.primaryColor,
              size: 24,
            ),
            hintText: hintText,
            hintStyle: MyFontStyle.subtitleText,
          ),
        ),
      ),
    );
  }
}
