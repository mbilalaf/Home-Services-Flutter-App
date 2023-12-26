import 'package:flutter/material.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';

class ServiceDretailCard extends StatelessWidget {
  const ServiceDretailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 350,
          decoration: BoxDecoration(
            color: MyColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: MyColors.black.withOpacity(0.1),
                offset: const Offset(4, 4),
                blurRadius: 30,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 180,
                      width: 160,
                      decoration: BoxDecoration(
                        color: MyColors.lightGray,
                        image: const DecorationImage(
                          image: AssetImage('assets/images/ac-repair.png'),
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AC Repair\nand Servicing",
                          style: MyFontStyle.mediumText.copyWith(),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "\$19.49",
                          style: MyFontStyle.mediumText.copyWith(
                            color: MyColors.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "By: Asif Ktk",
                          style: MyFontStyle.subtitleText.copyWith(),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  "Get AC services at your place within 90 minutes. We offer you a 30 Day service guarantee. We provide you with background verified trained technician .",
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
