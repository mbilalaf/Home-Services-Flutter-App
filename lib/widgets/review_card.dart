import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: MyColors.black.withOpacity(0.1),
            offset: const Offset(2, 2),
            blurRadius: 12,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 160,
              width: 120,
              decoration: BoxDecoration(
                color: MyColors.lightGray,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/review.png',
                  ),
                ),
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nelle Bates",
                      style: MyFontStyle.subtitleText.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Text(
                      "13 Aug, 2023",
                      style: MyFontStyle.smallText.copyWith(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                RatingBar(
                  minRating: 1,
                  maxRating: 5,
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
                  itemSize: 24,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 150,
                  child: Text(
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    "What a perfect service was provided by the expert guy. Excellent work",
                    style: MyFontStyle.subtitleText.copyWith(),
                  ),
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Image(
                      image: AssetImage(
                        "assets/icons/share.png",
                      ),
                    ),
                    SizedBox(width: 16),
                    Image(
                      image: AssetImage(
                        "assets/icons/like.png",
                      ),
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
