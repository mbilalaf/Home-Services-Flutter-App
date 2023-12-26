import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/rate_us_page.dart/rate_us_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.lightGray.withOpacity(0.3),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 200,
            left: 50,
            right: 50,
            bottom: 200,
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                color: MyColors.lightGreen,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            color: MyColors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            color: MyColors.white.withOpacity(0.18),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            color: MyColors.white.withOpacity(0.16),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        const Image(
                          height: 32,
                          image: AssetImage(
                            "assets/icons/thumb.png",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Thank You",
                      style: MyFontStyle.tilteText.copyWith(
                        color: MyColors.white,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      "Your Payment is successful. All the invoice related details are sent on your provided email address and mobile number.",
                      style: MyFontStyle.subtitleText.copyWith(
                        color: MyColors.white,
                      ),
                    ),
                    const SizedBox(height: 24),
                    InkWell(
                      onTap: () => Get.to(const RateUsPage()),
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: MyColors.white),
                        ),
                        child: Center(
                          child: Text(
                            "OK",
                            style: MyFontStyle.mediumText.copyWith(
                              color: MyColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
