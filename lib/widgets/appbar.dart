import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  const MyAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back,
                  color: MyColors.white,
                  size: 42,
                ),
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: MyColors.lightGray,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: MyFontStyle.largeText.copyWith(
              fontSize: 38,
              color: MyColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
