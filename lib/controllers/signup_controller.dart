import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/controllers/my_button_controller.dart';
import 'package:home_services/pages/menu_page/menu_page.dart';
import 'package:home_services/utils/colors.dart';

class SignUpController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isDone = false.obs; // Use RxBool for reactivity
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final GlobalKey<FormState> signUpFromKey = GlobalKey<FormState>();
  var fullName = '';
  var email = '';
  var mobileNumber = '';
  var password = '';
  var confirmPassword = '';

  static SignUpController get to =>
      Get.find<SignUpController>(); // Add this line

  final MyButtonController myButtonController = MyButtonController();

  void onSignUp() {
    print(
        'Full Name: ${fullNameController.text}\nEmail: ${emailController.text}\nPassword: ${passwordController.text}');
    print('On Signup');
    createAccount(
      emailController.text,
      passwordController.text,
      mobileNumberController.text,
      fullNameController.text,
    );
  }

  void checkSignUp() {
    final isValid = signUpFromKey.currentState!.validate();
    if (!isValid) {
      print('The form is not valid');
      return;
    } else {
      print('Form is valid now');
      signUpFromKey.currentState!.save();
      onSignUp();
    }
  }

  Future<void> createAccount(
    String email,
    password,
    mobileNumber,
    fullName,
  ) async {
    var userID;
    List<String> cartList = [];
    myButtonController.isLoading.value = true; // Start loading
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) async {
          userID = auth.currentUser!.uid;
          print('UserID $userID');
          await firebaseFirestore.collection('users').doc(userID).set({
            "uID": userID,
            "fullName": fullName,
            "mobileNumber": mobileNumber,
            "cartList": cartList
          }).whenComplete(
            () {
              myButtonController.isLoading.value = false;
              print("Account Created Successfully"); // Start loading
              Get.snackbar(
                'Account Status',
                'Account Created Successfully',
                snackStyle: SnackStyle.FLOATING,
                snackPosition: SnackPosition.TOP,
                colorText: Colors.white,
                padding: EdgeInsets.all(10),
                backgroundColor: MyColors.primaryColor,
              );
              Get.to(const MenuPage());
            },
          );
        },
      );
    } on FirebaseException catch (e) {
      if (e.code == "weak-password") {
        myButtonController.isLoading.value = false; // Start loading
        print("Weak Password");
        // return "Weak Password";
        Get.snackbar(
          'Password Status',
          'Weak Password',
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          padding: EdgeInsets.all(10),
          backgroundColor: MyColors.primaryColor,
        );
      } else if (e.code == "email-already-in-use") {
        myButtonController.isLoading.value = false; // Start loading
        print('This is email is already registered please Login!');
        Get.snackbar(
          'Account Status',
          'This is email is already registered please Login!',
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          padding: EdgeInsets.all(10),
          backgroundColor: MyColors.primaryColor,
        );
      }
      return;
    } catch (e) {
      myButtonController.isLoading.value = false; // Start loading
      print('Error Message: ${e.toString()}');
      return;
    }
  }

// @override
// void onClose() {
//   emailController.dispose();
//   passwordController.dispose();
//   fullNameController.dispose();
//   mobileNumberController.dispose();
//   confirmPasswordController.dispose();
// }
}
