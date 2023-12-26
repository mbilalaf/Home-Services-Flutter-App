import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/menu_page/menu_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/widgets/appbar.dart';
import 'package:home_services/widgets/button.dart';
import 'package:pinput/pinput.dart';

class PhoneVerificationPage extends StatelessWidget {
  const PhoneVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Column(
        children: [
          const Expanded(
            child: MyAppBar(title: "Phone Verification"),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 24,
                  top: 24,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      const Image(
                        height: 72,
                        image: AssetImage(
                          "assets/icons/mobile.png",
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Phone Verification",
                        style: MyFontStyle.tilteText,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        textAlign: TextAlign.center,
                        "Please enter your 4 digit pin sent on your registered mobile number",
                        style: MyFontStyle.captionText,
                      ),
                      const SizedBox(height: 40),
                      Pinput(
                        defaultPinTheme: PinTheme(
                          height: 70,
                          width: 60,
                          padding: const EdgeInsets.only(right: 16),
                          textStyle: MyFontStyle.mediumText,
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: MyColors.lightGray,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      MyButton(
                        btnText: "Register",
                        onTap: () {
                          Get.to(const MenuPage());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
