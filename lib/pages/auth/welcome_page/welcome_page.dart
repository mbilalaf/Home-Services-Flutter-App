import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/auth/signin_signup_pages/sign_in_page.dart';
import 'package:home_services/pages/auth/signin_signup_pages/sign_up_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/imagePath.dart';
import 'package:home_services/utils/statics.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/widgets/button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                height: size.height * 0.25,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      ImagePath.welcomeLogo,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Column(
                  children: [
                    Text(
                      Statics.weServe,
                      style: MyFontStyle.largeText,
                    ),
                    SizedBox(height: size.height * 0.005),
                    Text(
                      Statics.getReliable,
                      style: MyFontStyle.tilteText,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.height * 0.05),
                    MyButton(
                        btnText: Statics.signIn,
                        onTap: () => Get.to(const SignInPage())),
                    const SizedBox(height: 24),
                    MyButton(
                      btnText: Statics.signUp,
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
