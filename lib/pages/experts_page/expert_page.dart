import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/experts_page/experts_profile_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/widgets/appbar.dart';
import 'package:home_services/widgets/service_card.dart';

class ExpertsPage extends StatelessWidget {
  const ExpertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Column(
        children: [
          // custom appBar
          const Expanded(
            child: MyAppBar(
              title: 'Services',
            ),
          ),

          // content
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
                padding: const EdgeInsets.only(top: 24),
                child: InkWell(
                  onTap: () {
                    Get.to(
                      const ExpertsProfilePage(),
                    );
                  },
                  child: const ServiceCard(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
