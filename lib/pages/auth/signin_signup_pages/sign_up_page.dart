import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/auth/signin_signup_pages/sign_in_page.dart';
import 'package:home_services/pages/menu_page/menu_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/widgets/button.dart';
import 'package:home_services/widgets/textfield.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                    'assets/images/img-4.png',
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
                    hintText: "Full Name",
                    prefixIcon: Icons.person,
                  ),
                  const SizedBox(height: 16),
                  const MyTextfield(
                    hintText: "Email Address",
                    prefixIcon: Icons.email,
                  ),
                  const SizedBox(height: 16),
                  const MyTextfield(
                    hintText: "Mobile Number",
                    prefixIcon: Icons.phone_android,
                  ),
                  const SizedBox(height: 40),
                  MyButton(
                    btnText: 'Sign Up',
                    onTap: () {
                      Get.to(() => const MenuPage());
                    },
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: MyFontStyle.subtitleText,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(const SignInPage());
                        },
                        child: Text(
                          'Sign In',
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
