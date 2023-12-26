import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/services_page/service_details_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/widgets/appbar.dart';

import 'models/services_model.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  MenuController controller = Get.put(MenuController());
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Column(
        children: [
          const Expanded(
            child: MyAppBar(title: "Categories"),
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
                  top: 16,
                  bottom: 24,
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.68,
                  ),
                  itemCount: servicesList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => const ServiceDetailPage());
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: MyColors.primaryColor,
                              borderRadius: BorderRadius.circular(24),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(servicesList[index].img),
                              ),
                            ),
                            child: Image(
                              image: AssetImage(servicesList[index].img),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            servicesList[index].name,
                            style: MyFontStyle.mediumText,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<ServicesModel> servicesList = [
  ServicesModel(name: "AC Repair", img: 'assets/images/ac-repair.png'),
  ServicesModel(name: "Electration", img: 'assets/images/electration.png'),
  ServicesModel(name: "Carpenter", img: 'assets/images/carpenter.png'),
  ServicesModel(name: "Plumber", img: 'assets/images/plumber.png'),
  ServicesModel(name: "Plumber", img: 'assets/images/plumber.png'),
  ServicesModel(name: "Carpenter", img: 'assets/images/carpenter.png'),
];
