import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/controllers/services_controller/service_page/service_page_controller.dart';
import 'package:home_services/pages/services_page/services_list.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/widgets/appbar.dart';
import 'package:shimmer/shimmer.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  MenuController controller = Get.put(MenuController());
  ServicePageController servicesPageController =
      Get.put(ServicePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            const MyAppBar(title: "Categories"),
            Obx(() {
              return Expanded(
                child: Container(
                  width: double.infinity,
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
                        top: 16,
                        bottom: 24,
                      ),
                      child: (servicesPageController.isLoading.value)
                          ? const Center(child: CircularProgressIndicator())
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 24,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.77,
                              ),
                              itemCount: servicesPageController.menuList.length,
                              itemBuilder: (context, index) {
                                print('Index: $index');
                                print(
                                    'Length: ${servicesPageController.menuList.length}');
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() => ServicesList(
                                          title: servicesPageController
                                              .menuList[index].title,
                                        ));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Container(
                                      //     height: MediaQuery.of(context)
                                      //             .size
                                      //             .height *
                                      //         0.2,
                                      //     decoration: BoxDecoration(
                                      //       borderRadius:
                                      //           BorderRadius.circular(24),
                                      //     ),
                                      //     child: FadeInImage.assetNetwork(
                                      //       placeholder:
                                      //           'assets/images/loading.png',
                                      //       image: servicesPageController
                                      //           .menuList[index].img,
                                      //     )),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: CachedNetworkImage(
                                          height: Get.height * 0.2,
                                          width: Get.width * 0.4,
                                          fit: BoxFit.cover,
                                          imageUrl: servicesPageController
                                              .menuList[index].img,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Center(
                                            child: SizedBox(
                                              height: Get.height * 0.2,
                                              width: Get.width * 0.4,
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
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        servicesPageController
                                            .menuList[index].title,
                                        style: MyFontStyle.mediumText,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

// List<ServicesModel> servicesList = [
//   ServicesModel(name: "AC Repair", img: 'assets/images/ac-repair.png'),
//   ServicesModel(name: "Electration", img: 'assets/images/electration.png'),
//   ServicesModel(name: "Carpenter", img: 'assets/images/carpenter.png'),
//   ServicesModel(name: "Plumber", img: 'assets/images/plumber.png'),
//   ServicesModel(name: "Plumber", img: 'assets/images/plumber.png'),
//   ServicesModel(name: "Carpenter", img: 'assets/images/carpenter.png'),
// ];
