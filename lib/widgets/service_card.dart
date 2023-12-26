import 'package:flutter/material.dart';
import 'package:home_services/pages/services_page/models/services_model.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: experList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 12,
            ),
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
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/images/profile.png'),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              experList[index].name,
                              style: MyFontStyle.subtitleText.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              experList[index].category,
                              style: MyFontStyle.smallText,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Image(
                          height: 24,
                          image: AssetImage(
                            'assets/icons/message.png',
                          ),
                        ),
                        SizedBox(width: 16),
                        Image(
                          height: 24,
                          image: AssetImage(
                            'assets/icons/phone.png',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<ExpertsModel> experList = [
  ExpertsModel(name: "Alan Bowers", category: "AC Repair"),
  ExpertsModel(name: "Jaden Conner", category: "Electrition"),
  ExpertsModel(name: "Rodney Perkins", category: "Carpenter"),
  ExpertsModel(name: "Glen Thornton", category: "Painter"),
];
