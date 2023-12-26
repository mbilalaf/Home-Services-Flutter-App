import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/auth/signin_signup_pages/sign_in_page.dart';
import 'package:home_services/pages/auth/signin_signup_pages/sign_up_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/widgets/button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/img-2.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    const Text(
                      "WeServe",
                      style: MyFontStyle.largeText,
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Get Reliable & Affordable Services instantly",
                      style: MyFontStyle.tilteText,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    MyButton(
                        btnText: 'Sign In',
                        onTap: () => Get.to(const SignInPage())),
                    const SizedBox(height: 24),
                    MyButton(
                      btnText: "Sign Up",
                      onTap: () {
                        Get.to(
                          const SignUpPage(),
                        );
                      },
                      btnColor: MyColors.white,
                      showBorder: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
