import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/utils/colors.dart';

class CustomSnackBar {
  static void show({String? title, String? message}) {
    Get.snackbar(
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      title.toString(),
      message.toString(),
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      colorText: Colors.white,
      padding: const EdgeInsets.all(10),
      backgroundColor: MyColors.purple,
    );
  }
}
