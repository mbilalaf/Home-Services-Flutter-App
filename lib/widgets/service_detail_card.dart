import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:shimmer/shimmer.dart';

class ServiceDretailCard extends StatelessWidget {
  String? docID, service, name, price, img, description;

  ServiceDretailCard(
      {super.key,
      this.docID,
      this.service,
      this.name,
      this.img,
      this.price,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.33,
          decoration: BoxDecoration(
            color: MyColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: MyColors.black.withOpacity(0.1),
                offset: const Offset(4, 4),
                blurRadius: 10,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        height: Get.height * 0.16,
                        width: Get.width * 0.34,
                        fit: BoxFit.cover,
                        imageUrl: img.toString(),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => SizedBox(
                          height: Get.height * 0.16,
                          width: Get.width * 0.34,
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
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // "AC Repair\nand Servicing",
                          service.toString(),
                          style: MyFontStyle.mediumText.copyWith(),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "RS: $price",
                          style: MyFontStyle.mediumText.copyWith(
                            color: MyColors.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "By: $name",
                          style: MyFontStyle.subtitleText.copyWith(),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  // "Get AC services at your place within 90 minutes. We offer you a 30 Day service guarantee. We provide you with background verified trained technician.",
                  description.toString(),
                  style: MyFontStyle.captionText,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
