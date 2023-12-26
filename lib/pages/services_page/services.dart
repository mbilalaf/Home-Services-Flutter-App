import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/controllers/services_list_controller.dart';
import 'package:home_services/pages/services_page/service_details_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/services_list_model.dart';

class Services extends StatelessWidget {
  String? title;

  Services({super.key, this.title});

  ServicesListController servicesListController =
      Get.put(ServicesListController());

  @override
  Widget build(BuildContext context) {
    // List<ServicesListModel> filteredServices = servicesListController
    //     .servicesList
    //     .where((service) => service.service_type == title)
    //     .toList();
    // print('Title: $title');
    // print('Filtered Services: ${filteredServices}');
    return FutureBuilder(
      future: servicesListController.fetchServicesList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading data'));
        } else {
          List<ServicesListModel> filteredServices = servicesListController
              .servicesList
              .where((service) => service.service_type == title)
              .toList();

          if (filteredServices.isEmpty) {
            return const Center(
              child: Text('Data not found'),
            );
          }

          return ListView.builder(
            itemCount: filteredServices.length,
            itemBuilder: (context, index) {
              ServicesListModel service = filteredServices[index];
              // Use the first service in the filtered list
              return Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 12,
                ),
                child: InkWell(
                  onTap: () {
                    Get.to(
                      ServiceDetailPage(
                        docID: service.docID,
                        name: service.name,
                        service: service.service,
                        img: service.img,
                        description: service.description,
                        price: service.price,
                        galleryList: service.gallery,
                      ),
                    );
                  },
                  child: Container(
                    height: Get.height * 0.14,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: MyColors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: MyColors.black.withOpacity(0.069),
                          blurRadius: 12,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: CachedNetworkImage(
                                  height: Get.height * 0.14,
                                  width: Get.width * 0.25,
                                  fit: BoxFit.cover,
                                  imageUrl: service.img,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                    child: SizedBox(
                                      height: Get.height * 0.14,
                                      width: Get.width * 0.25,
                                      child: Shimmer.fromColors(
                                        baseColor: MyColors.lightGray,
                                        highlightColor: MyColors.darkGray,
                                        child: Container(
                                          height: Get.height * 0.2,
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
                              const SizedBox(width: 16),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    service.name,
                                    style: MyFontStyle.subtitleText.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Text(
                                    'Estimated Price',
                                    style: MyFontStyle.smallText,
                                  ),
                                  Text(
                                    'RS: ${service.price}',
                                    style: MyFontStyle.subtitleText.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: MyColors.green),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Image(
                                height: 20,
                                image: AssetImage(
                                  'assets/icons/message.png',
                                ),
                                color: MyColors.primaryColor,
                              ),
                              SizedBox(width: 16),
                              Image(
                                height: 20,
                                image: AssetImage(
                                  'assets/icons/phone.png',
                                ),
                                color: MyColors.phoneGreen,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
