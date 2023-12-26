import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/utils/colors.dart';

import '../controllers/my_button_controller.dart';
import '../utils/styles.dart';

class MyButton extends StatelessWidget {
  final String btnText;
  final Color? btnColor;
  final bool showBorder;
  final void Function() onTap;
  double width, height;
  MyButtonController? controller;
  bool isUpdated;
  bool changeStyle;
  double radius;
  MyButton(
      {super.key,
      required this.btnText,
      required this.onTap,
      this.btnColor = MyColors.primaryColor,
      this.showBorder = false,
      this.controller,
      this.width = 1,
      this.height = 60,
      this.changeStyle = false,
      this.radius = 16,
      this.isUpdated = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height,
          width: MediaQuery.of(context).size.width * width,
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(radius),
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
              child: isUpdated
                  ? Obx(() => controller?.isLoading.value ?? false
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          btnText,
                          style: MyFontStyle.captionText.copyWith(
                            color:
                                showBorder ? MyColors.darkGray : MyColors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ))
                  : Text(
                      btnText,
                      style: changeStyle
                          ? const TextStyle(fontSize: 10, color: Colors.white)
                          : MyFontStyle.captionText.copyWith(
                              color: showBorder
                                  ? MyColors.darkGray
                                  : MyColors.white,
                              fontWeight: FontWeight.w700,
                            ),
                    ))),
    );
  }
}
