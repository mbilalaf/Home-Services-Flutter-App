import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartsDialog {
  static show(
      {required String title, content, required VoidCallback onYesPress}) {
    RxBool isLoading = false.obs;

    Get.dialog(
        barrierDismissible: false,
        Obx(() => isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : AlertDialog(
                title: Text(title),
                content: Text(content),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back(); // Close the dialog
                    },
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: onYesPress,
                    child: const Text('Yes'),
                  ),
                ],
              )));
  }
}
