import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/controllers/my_button_controller.dart';
import 'package:home_services/pages/auth/signin_signup_pages/sign_in_page.dart';
import 'package:home_services/widgets/custom_snackbar.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> signInFromKey = GlobalKey<FormState>();
  var email = '';

  final FirebaseAuth auth = FirebaseAuth.instance;

  static ForgotPasswordController get to =>
      Get.find<ForgotPasswordController>(); // Add this line

  final MyButtonController myButtonController = MyButtonController();

  void onResetPassword() {
    print('EMail: ${emailController.text}');
    forgotPassword(emailController.text);
  }

  void resetPassword() {
    final isValid = signInFromKey.currentState!.validate();
    if (!isValid) {
      print('The form is not valid');
      return;
    } else {
      print('Form is valid now');
      signInFromKey.currentState!.save();
      onResetPassword();
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      myButtonController.isLoading.value = true;
      await auth.sendPasswordResetEmail(email: email).then((value) {
        myButtonController.isLoading.value = false;
        CustomSnackBar.show(
            title: 'Success',
            message:
                'Link has been successfully sent to your email. Check your email.');
        Get.offAll(const SignInPage());
      }).onError(
        (error, stackTrace) {
          CustomSnackBar.show(
              title: 'Password Rest Error Status', message: error.toString());
        },
      );
    } catch (e) {
      myButtonController.isLoading.value = false;
      print("Error Message: ${e.toString()}");

      CustomSnackBar.show(title: 'Error Message', message: e.toString());
    } finally {
      myButtonController.isLoading.value = false;
    }
  }

// @override
// void onClose() {
//   emailController.dispose();
//   passwordController.dispose();
// }
}
