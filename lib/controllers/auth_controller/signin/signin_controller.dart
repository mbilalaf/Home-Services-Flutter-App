import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/controllers/my_button_controller.dart';
import 'package:home_services/pages/menu_page/menu_page.dart';
import 'package:home_services/widgets/custom_snackbar.dart';

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> signInFromKey = GlobalKey<FormState>();
  var email = '';
  var password = '';

  final FirebaseAuth auth = FirebaseAuth.instance;

  static SignInController get to =>
      Get.find<SignInController>(); // Add this line

  final MyButtonController myButtonController = MyButtonController();

  void onSignIn() {
    print(
        'EMail: ${emailController.text}\nPassword: ${passwordController.text}');
    accountLogin(emailController.text, passwordController.text);
  }

  void checkSignUp() {
    final isValid = signInFromKey.currentState!.validate();
    if (!isValid) {
      print('The form is not valid');
      return;
    } else {
      print('Form is valid now');
      signInFromKey.currentState!.save();
      onSignIn();
    }
  }

  Future<void> accountLogin(String email, String password) async {
    try {
      myButtonController.isLoading.value = true;
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        myButtonController.isLoading.value = false;
        Get.offAll(const MenuPage());

        CustomSnackBar.show(
            title: 'Login Status', message: 'User Logged in Successfully');
      }).onError(
        (error, stackTrace) {
          CustomSnackBar.show(
              title: 'Account Status', message: error.toString());
        },
      );
    } on FirebaseException catch (e) {
      print('Firebase Exception: $e');
      if (e.code == 'user-not-found') {
        myButtonController.isLoading.value = false;
        print('User Does not exist');
        CustomSnackBar.show(
            title: 'Account Status', message: 'User Does not exist');
      } else if (e.code == 'wrong-password') {
        myButtonController.isLoading.value = false;
        print('Wrong Password');

        CustomSnackBar.show(
            title: 'Password Status', message: 'Wrong Password');
      }
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
