import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/controllers/services_controller/services_list/services_list_controller.dart';
import 'package:home_services/models/services_list_model.dart';
import 'package:home_services/pages/experts_page/experts_profile_page.dart';
import 'package:home_services/pages/services_page/models/services_model.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:shimmer/shimmer.dart';

class ServiceCard extends StatelessWidget {
  ServiceCard({
    super.key,
  });

  // ExpertsPageController expertsPageController =
  //     Get.put(ExpertsPageController());
  ServicesListController servicesListController =
      Get.put(ServicesListController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return (servicesListController.isLoading.value)
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: servicesListController.servicesList.length,
                itemBuilder: (context, index) {
                  print('Index: $index');
                  ServicesListModel experts =
                      servicesListController.servicesList[index];
                  // Convert reviews to integer
                  int? reviews = int.tryParse(experts.reviews);
                  print("REviews: $reviews");
                  if (reviews! > 10) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 12,
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.to(
                            ExpertsProfilePage(
                                docID: experts.docID,
                                img: experts.img,
                                name: experts.name,
                                service: experts.service,
                                comments: experts.comments,
                                reviews: experts.reviews,
                                shares: experts.shares,
                                gallery: experts.gallery),
                          );
                        },
                        child: Container(
                          height: 100,
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
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: CachedNetworkImage(
                                        height: Get.height * 0.1,
                                        width: Get.width * 0.2,
                                        fit: BoxFit.cover,
                                        imageUrl: experts.img,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Center(
                                          child: SizedBox(
                                            height: Get.height * 0.1,
                                            width: Get.width * 0.2,
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
                                    const SizedBox(width: 16),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          experts.name,
                                          style:
                                              MyFontStyle.subtitleText.copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          experts.service_type.toString(),
                                          style: MyFontStyle.subtitleText
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color: MyColors.green),
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Estimated Price ',
                                              style: MyFontStyle.smallText,
                                            ),
                                            Text(
                                              'RS: ${experts.price.toString()}',
                                              style: MyFontStyle.subtitleText
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: MyColors.green),
                                            ),
                                          ],
                                        )
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
                  } else {
                    return Container();
                  }
                },
              );
      },
    );
  }
}

List<ExpertsModel> experList = [
  ExpertsModel(name: "Alan Bowers", category: "AC Repair"),
  ExpertsModel(name: "Jaden Conner", category: "Electrition"),
  ExpertsModel(name: "Rodney Perkins", category: "Carpenter"),
  ExpertsModel(name: "Glen Thornton", category: "Painter"),
];
