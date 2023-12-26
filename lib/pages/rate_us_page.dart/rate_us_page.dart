import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/widgets/appbar.dart';
import 'package:home_services/widgets/button.dart';

class RateUsPage extends StatelessWidget {
  const RateUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Column(
        children: [
          const Expanded(
            child: MyAppBar(title: "Rate us"),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    const Text(
                      textAlign: TextAlign.center,
                      "Please Rate Your Service\nExperience",
                      style: MyFontStyle.tilteText,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      textAlign: TextAlign.center,
                      "Your Valuable Ratings help us to improve our services. It helps us to serve you better.",
                      style: MyFontStyle.captionText,
                    ),
                    const SizedBox(height: 40),
                    RatingBar(
                      minRating: 1,
                      maxRating: 5,
                      initialRating: 5,
                      ratingWidget: RatingWidget(
                        full: const Icon(
                          Icons.star,
                          color: MyColors.primaryColor,
                        ),
                        half: const Icon(
                          Icons.star_half,
                          color: MyColors.lightGray,
                        ),
                        empty: const Icon(
                          color: MyColors.lightGray,
                          Icons.star_border_outlined,
                        ),
                      ),
                      onRatingUpdate: (value) {},
                      itemSize: 42,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: MyButton(
                            btnText: "Submit",
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: MyButton(
                            btnText: "Share",
                            onTap: () {},
                          ),
                        ),
                      ],
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
