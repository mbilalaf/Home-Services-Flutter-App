import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/cart_page/cart_page.dart';
import 'package:home_services/pages/services_page/models/service_gallery_model.dart';
import 'package:home_services/pages/services_page/select_location_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/widgets/appbar.dart';
import 'package:home_services/widgets/button.dart';
import 'package:home_services/widgets/service_detail_card.dart';

class ServiceDetailPage extends StatelessWidget {
  const ServiceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Column(
        children: [
          const Expanded(
            child: MyAppBar(title: "Service Details"),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // service details card
                      const ServiceDretailCard(),

                      const SizedBox(height: 24),

                      // service gallery
                      const Text(
                        "Service Gallery",
                        style: MyFontStyle.tilteText,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          itemCount: galleryList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                right: 16,
                              ),
                              child: Container(
                                height: 150,
                                width: 160,
                                decoration: BoxDecoration(
                                  color: MyColors.lightGray,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      galleryList[index].img,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),

                      // buttons
                      Row(
                        children: [
                          Expanded(
                            child: MyButton(
                              btnText: "Book Now",
                              onTap: () {
                                Get.to(const SelectLocationPage());
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: MyButton(
                              btnText: "Book Later",
                              onTap: () {
                                Get.to(const CartPage());
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
