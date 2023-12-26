import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/experts_page/reviews_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';

class ProviderCard extends StatelessWidget {
  const ProviderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: MyColors.black.withOpacity(0.1),
            offset: const Offset(5, 5),
            blurRadius: 20,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: MyColors.lightGray,
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/profile-cover.png',
                  ),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Logan Frank",
              style: MyFontStyle.mediumText.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            const Text(
              "New York",
              style: MyFontStyle.captionText,
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "345",
                      style: MyFontStyle.mediumText.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      "Comments",
                      style: MyFontStyle.captionText,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => Get.to(const ReviewsPage()),
                  child: Column(
                    children: [
                      Text(
                        "121",
                        style: MyFontStyle.mediumText.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        "Reviews",
                        style: MyFontStyle.captionText,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "745",
                      style: MyFontStyle.mediumText.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      "Shares",
                      style: MyFontStyle.captionText,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
