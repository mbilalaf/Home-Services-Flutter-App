import 'package:flutter/material.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';

class MyButton extends StatelessWidget {
  final String btnText;
  final Color? btnColor;
  final bool showBorder;
  final void Function() onTap;
  const MyButton({
    super.key,
    required this.btnText,
    required this.onTap,
    this.btnColor = MyColors.primaryColor,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: MyColors.black.withOpacity(0.1),
              offset: const Offset(2, 2),
              blurRadius: 22,
              spreadRadius: 3,
            )
          ],
        ),
        child: Center(
          child: Text(
            btnText,
            style: MyFontStyle.captionText.copyWith(
              color: showBorder ? MyColors.darkGray : MyColors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
