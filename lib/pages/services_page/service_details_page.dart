import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/controllers/add_to_cart_controller/add_to_cart_controller.dart';
import 'package:home_services/pages/services_page/models/service_gallery_model.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/widgets/appbar.dart';
import 'package:home_services/widgets/button.dart';
import 'package:home_services/widgets/service_detail_card.dart';
import 'package:home_services/widgets/what_bottom_sheet.dart';
import 'package:shimmer/shimmer.dart';

class ServiceDetailPage extends StatelessWidget {
  String? docID, service, name, price, img, description;
  AddToCartController addToCartController = Get.put(AddToCartController());
  List<String?>? galleryList;

  ServiceDetailPage(
      {super.key,
      this.docID,
      this.service,
      this.name,
      this.img,
      this.price,
      this.description,
      this.galleryList});

  final Uri workerWhatsapp = Uri.parse('https://wa.me/+923348328351');
  final Uri customerServiceWhatsapp = Uri.parse('https://wa.me/++923480051552');

  @override
  Widget build(BuildContext context) {
    print('-------------------Doc ID: $docID------------------');

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: Column(
          children: [
            const MyAppBar(title: "Service Details"),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // service details card
                        ServiceDretailCard(
                          img: img,
                          name: name,
                          service: service,
                          description: description,
                          price: price,
                        ),

                        SizedBox(height: Get.height * 0.03),
                        // service gallery
                        const Text(
                          "Service Gallery",
                          style: MyFontStyle.tilteText,
                        ),
                        SizedBox(height: Get.height * 0.03),
                        Container(
                          height: 150,
                          child: (galleryList?.length == 0)
                              ? const Center(child: Text('Do not have Gallery'))
                              : ListView.builder(
                                  itemCount: galleryList?.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    print(
                                        'Gallery List Length: ${galleryList?.length}');
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
                                          imageUrl:
                                              galleryList![index].toString(),
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Center(
                                            child: SizedBox(
                                              height: Get.height * 0.2,
                                              width: Get.width * 0.37,
                                              child: Shimmer.fromColors(
                                                baseColor: MyColors.lightGray,
                                                highlightColor:
                                                    MyColors.darkGray,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.2,
                                                  decoration: BoxDecoration(
                                                    color: MyColors.lightGray,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
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
                        SizedBox(height: Get.height * 0.13),
                        // buttons
                        Row(
                          children: [
                            Expanded(
                              child: MyButton(
                                btnText: "Book Now",
                                onTap: () {
                                  // Get.to(const SelectLocationPage());
                                  whatsappBottomSheet(
                                      workerWhatsapp, customerServiceWhatsapp);
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: MyButton(
                                isUpdated: true,
                                btnText: "Book Later",
                                controller:
                                    AddToCartController.to.myButtonController,
                                onTap: () {
                                  // Create a Map with service details
                                  addToCartController
                                      .addToCart(docID.toString());
                                  // Get.to(const CartPage());
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<ServiceGalleryModel> galleryList = [
  ServiceGalleryModel(img: 'assets/images/ac-repair.png'),
  ServiceGalleryModel(img: 'assets/images/electration.png'),
  ServiceGalleryModel(img: 'assets/images/carpenter.png'),
  ServiceGalleryModel(img: 'assets/images/plumber.png'),
  ServiceGalleryModel(img: 'assets/images/ac-repair.png'),
];
