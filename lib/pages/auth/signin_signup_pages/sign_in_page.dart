import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/auth/signin_signup_pages/sign_up_page.dart';
import 'package:home_services/pages/menu_page/menu_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/widgets/button.dart';
import 'package:home_services/widgets/textfield.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/img-3.png',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  const MyTextfield(
                    hintText: "User name",
                    prefixIcon: Icons.person,
                  ),
                  const SizedBox(height: 16),
                  const MyTextfield(
                    hintText: "Password",
                    prefixIcon: Icons.lock,
                  ),
                  const SizedBox(height: 40),
                  MyButton(
                    btnText: 'Sign In',
                    onTap: () => Get.to(const MenuPage()),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Forgot Password?',
                    style: MyFontStyle.subtitleText.copyWith(
                      fontWeight: FontWeight.w700,
                      color: MyColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account? ',
                        style: MyFontStyle.subtitleText,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(const SignUpPage());
                        },
                        child: Text(
                          'Sign Up',
                          style: MyFontStyle.subtitleText.copyWith(
                            fontWeight: FontWeight.w700,
                            color: MyColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
