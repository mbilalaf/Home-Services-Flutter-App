import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/controllers/add_to_cart_controller/add_to_cart_controller.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/widgets/appbar.dart';
import 'package:home_services/widgets/button.dart';
import 'package:home_services/widgets/provider_card.dart';
import 'package:home_services/widgets/what_bottom_sheet.dart';
import 'package:shimmer/shimmer.dart';

class ExpertsProfilePage extends StatelessWidget {
  String? docID, img, name, service, comments, reviews, shares;
  List<String?>? gallery;

  AddToCartController addToCartController = Get.put(AddToCartController());

  ExpertsProfilePage(
      {super.key,
      this.docID,
      this.img,
      this.name,
      this.service,
      this.comments,
      this.reviews,
      this.shares,
      this.gallery});

  final Uri workerWhatsapp = Uri.parse('https://wa.me/+923348328351');
  final Uri customerServiceWhatsapp = Uri.parse('https://wa.me/++923480051552');

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: Column(
          children: [
            const MyAppBar(title: "Providers Profile"),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    ProviderCard(
                        docID: docID,
                        img: img,
                        name: name,
                        service: service,
                        comments: comments,
                        shares: shares,
                        reviews: reviews,
                        gallery_list: gallery),
                    SizedBox(height: height * 0.03),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Service Gallery",
                            style: MyFontStyle.tilteText,
                          ),
                          Text(
                            "View More",
                            style: MyFontStyle.captionText,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    SizedBox(
                      height: height * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: (gallery!.isEmpty)
                            ? const Center(child: Text('Do not have Gallery'))
                            : ListView.builder(
                                itemCount: gallery?.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      right: 16,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: CachedNetworkImage(
                                        height: Get.height * 0.1,
                                        width: Get.width * 0.37,
                                        fit: BoxFit.cover,
                                        imageUrl: gallery![index].toString(),
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Center(
                                          child: SizedBox(
                                            height: Get.height * 0.2,
                                            width: Get.width * 0.37,
                                            child: Shimmer.fromColors(
                                              baseColor: MyColors.lightGray,
                                              highlightColor: MyColors.darkGray,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                decoration: BoxDecoration(
                                                  color: MyColors.lightGray,
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                    SizedBox(height: height * 0.07),
                    // buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: MyButton(
                              btnText: "Book Now",
                              onTap: () {
                                whatsappBottomSheet(
                                    workerWhatsapp, customerServiceWhatsapp);
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: MyButton(
                              isUpdated: true,
                              controller:
                                  AddToCartController.to.myButtonController,
                              btnText: "Book Later",
                              onTap: () {
                                // Create a Map with service details
                                addToCartController.addToCart(docID.toString());
                                // Get.to(const CartPage());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
