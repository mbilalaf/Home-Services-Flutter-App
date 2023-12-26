import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/controllers/signin_controller.dart';
import 'package:home_services/pages/auth/signin_signup_pages/sign_up_page.dart';
import 'package:home_services/pages/forgot_password/forgot_password_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/imagePath.dart';
import 'package:home_services/utils/statics.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/validations/validator.dart';
import 'package:home_services/widgets/button.dart';
import 'package:home_services/widgets/textfield.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    SignInController signInController = Get.put(SignInController());
    RxBool isObscure = true.obs;
    double size = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size * 0.4,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    ImagePath.signInImage,
                  ),
                ),
              ),
            ),
            SizedBox(height: size * 0.1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: signInController.signInFromKey,
                  child: Column(
                    children: [
                      MyTextfield(
                        textEditingController: signInController.emailController,
                        hintText: Statics.email,
                        prefixIcon: Icons.email,
                        onSaved: (value) {
                          signInController.email = value!;
                        },
                        validator: (v) {
                          return Validator().validateEmail(v!);
                        },
                      ),
                      const SizedBox(height: 16),
                      Obx(
                        () {
                          return MyTextfield(
                            isPassword: true,
                            isObscure: isObscure.value,
                            textEditingController:
                                signInController.passwordController,
                            hintText: Statics.password,
                            prefixIcon: Icons.lock,
                            onSaved: (value) {
                              signInController.password = value!;
                            },
                            onPress: () {
                              isObscure.value = !isObscure.value;
                            },
                            validator: (v) {
                              return Validator().validatePassword(v!);
                            },
                          );
                        },
                      ),
                      SizedBox(height: size * 0.05),
                      MyButton(
                          isUpdated: true,
                          controller: SignInController.to.myButtonController,
                          btnText: Statics.signIn,
                          onTap: () {
                            signInController.checkSignUp();
                            // signInController.onSignIn(),
                          }),
                      SizedBox(height: size * 0.02),
                      InkWell(
                        onTap: () {
                          Get.to(const ForgotPasswordPage());
                        },
                        child: Text(
                          Statics.forgotPassword,
                          style: MyFontStyle.subtitleText.copyWith(
                            fontWeight: FontWeight.w700,
                            color: MyColors.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(height: size * 0.007),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Statics.dontHave,
                            style: MyFontStyle.subtitleText,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(const SignUpPage());
                            },
                            child: Text(
                              Statics.signUp,
                              style: MyFontStyle.subtitleText.copyWith(
                                fontWeight: FontWeight.w700,
                                color: MyColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
