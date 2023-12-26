import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/rate_us_page.dart/rate_us_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: MyColors.primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
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
            style: MyFontStyle.tilteText
                .copyWith(fontSize: 22, color: MyColors.white),
          ),
          const SizedBox(height: 24),
          Text(
            "Your Payment is successful. All the invoice related details are sent on your provided email address and mobile number.",
            style: MyFontStyle.subtitleText.copyWith(color: MyColors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              // Close the dialog
              Get.back();

              // Navigate to RateUsPage after the dialog is closed
              Future.delayed(Duration.zero, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RateUsPage()),
                );
              });
            },
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
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
