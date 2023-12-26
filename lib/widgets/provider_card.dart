import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/experts_page/reviews_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:shimmer/shimmer.dart';

class ProviderCard extends StatelessWidget {
  String? docID, img, name, service, comments, reviews, shares;
  List<String?>? gallery_list;

  ProviderCard(
      {super.key,
      this.docID,
      this.img,
      this.name,
      this.service,
      this.comments,
      this.reviews,
      this.shares,
      this.gallery_list});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      height: height * 0.355,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: MyColors.black.withOpacity(0.06),
            offset: const Offset(5, 5),
            blurRadius: 5,
          ),
          BoxShadow(
            color: MyColors.black.withOpacity(0.06),
            offset: const Offset(-5, -5),
            blurRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                height: Get.height * 0.16,
                width: Get.width * 0.4,
                fit: BoxFit.cover,
                imageUrl: img.toString(),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: SizedBox(
                    height: Get.height * 0.16,
                    width: Get.width * 0.4,
                    child: Shimmer.fromColors(
                      baseColor: MyColors.lightGray,
                      highlightColor: MyColors.darkGray,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          color: MyColors.lightGray,
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(height: height * 0.009),
            Text(
              name.toString(),
              style: MyFontStyle.mediumText.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: height * 0.003),
            Text(
              service.toString(),
              style: MyFontStyle.captionText,
            ),
            SizedBox(height: height * 0.015),
            const Divider(),
            SizedBox(height: height * 0.003),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      comments.toString(),
                      style: MyFontStyle.mediumText.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: height * 0.008),
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
                        reviews.toString(),
                        style: MyFontStyle.mediumText.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: height * 0.008),
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
                      shares.toString(),
                      style: MyFontStyle.mediumText.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: height * 0.008),
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
