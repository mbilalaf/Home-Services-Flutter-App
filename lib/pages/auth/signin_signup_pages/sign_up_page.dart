import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/controllers/auth_controller/signup/signup_controller.dart';
import 'package:home_services/pages/auth/signin_signup_pages/sign_in_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/imagePath.dart';
import 'package:home_services/utils/statics.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/validations/validator.dart';
import 'package:home_services/widgets/button.dart';
import 'package:home_services/widgets/textfield.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isPassObscure = true.obs;
    RxBool isConfirmPassObscure = true.obs;
    SignUpController signupController = Get.put(SignUpController());
    double size = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: size * 0.3,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      ImagePath.signUpImage,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size * 0.015),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: signupController.signUpFromKey,
                  child: Obx(() {
                    return Column(
                      children: [
                        MyTextfield(
                          textEditingController:
                              signupController.fullNameController,
                          hintText: Statics.fullName,
                          prefixIcon: Icons.person,
                          onSaved: (value) {
                            signupController.fullName = value!;
                          },
                          validator: (v) {
                            return Validator().validateFullName(v!);
                          },
                        ),
                        SizedBox(height: size * 0.015),
                        MyTextfield(
                          textEditingController:
                              signupController.emailController,
                          hintText: Statics.email,
                          onSaved: (value) {
                            signupController.email = value!;
                          },
                          validator: (v) {
                            return Validator().validateEmail(v!);
                          },
                          prefixIcon: Icons.email,
                        ),
                        SizedBox(height: size * 0.015),
                        MyTextfield(
                          textEditingController:
                              signupController.mobileNumberController,
                          hintText: Statics.mobileNum,
                          prefixIcon: Icons.phone_android,
                          onSaved: (value) {
                            signupController.mobileNumber = value!;
                          },
                          validator: (v) {
                            return Validator().validatePhoneNumber(v!);
                          },
                        ),
                        SizedBox(height: size * 0.015),
                        MyTextfield(
                          isPassword: true,
                          isObscure: isPassObscure.value,
                          textEditingController:
                              signupController.passwordController,
                          hintText: Statics.password,
                          prefixIcon: Icons.phone_android,
                          onSaved: (value) {
                            signupController.password = value!;
                          },
                          validator: (v) {
                            return Validator().validatePassword(v!);
                          },
                          onPress: () {
                            isPassObscure.value = !isPassObscure.value;
                          },
                        ),
                        SizedBox(height: size * 0.015),
                        MyTextfield(
                          isPassword: true,
                          isObscure: isConfirmPassObscure.value,
                          textEditingController:
                              signupController.confirmPasswordController,
                          hintText: Statics.confirmPassword,
                          prefixIcon: Icons.phone_android,
                          onSaved: (value) {
                            signupController.confirmPassword = value!;
                          },
                          onPress: () {
                            isConfirmPassObscure.value =
                                !isConfirmPassObscure.value;
                          },
                          validator: (v) {
                            return Validator().validateConfirmPassword(
                                v!,
                                signupController.passwordController.text
                                    .toString());
                          },
                        ),
                        SizedBox(height: size * 0.04),
                        MyButton(
                          isUpdated: true,
                          controller: SignUpController.to.myButtonController,
                          btnText: Statics.signUp,
                          onTap: () {
                            signupController.checkSignUp();
                            // print('Before Is Done: ${signupController.isDone}');
                            // signupController.onSignUp();
                            // print('After Is Done: ${signupController.isDone}');
                            // Get.to(() => const MenuPage());
                          },
                        ),
                        SizedBox(height: size * 0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Statics.alreadyHave,
                              style: MyFontStyle.subtitleText,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.offAll(const SignInPage());
                              },
                              child: Text(
                                Statics.signIn,
                                style: MyFontStyle.subtitleText.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: MyColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
