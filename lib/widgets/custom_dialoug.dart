import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/auth/signin_signup_pages/sign_in_page.dart';

class SignOutDialog {
  static show() {
    RxBool isLoading = false.obs;

    Get.dialog(
        barrierDismissible: false,
        Obx(() => isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : AlertDialog(
                title: const Text('Logout'),
                content: const Text('Are you sure you want to Logout?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back(); // Close the dialog
                    },
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () async {
                      try {
                        isLoading.value = true; // Show loader
                        await FirebaseAuth.instance.signOut();
                        Get.back(); // Close the dialog
                        Get.offAll(const SignInPage());
                        isLoading.value = false;
                      } catch (e) {
                        isLoading.value = false; // Hide loader on error
                        Get.snackbar(
                          'Error',
                          e.toString(),
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Colors.white,
                          padding: const EdgeInsets.all(10),
                          backgroundColor: Colors.black,
                        );
                      }
                    },
                    child: const Text('Yes'),
                  ),
                ],
              )));
  }
}
