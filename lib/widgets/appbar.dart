import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/widgets/remove_items_dialoug.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAppBar extends StatelessWidget {
  final String title;

  const MyAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final Uri customerServiceWhatsapp =
        Uri.parse('https://wa.me/++923480051552');
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: MyColors.white,
                  size: 28,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  title,
                  style: MyFontStyle.largeText.copyWith(
                    fontSize: 26,
                    color: MyColors.white,
                  ),
                ),
              ),
              // Image(
              //   image: AssetImage('assets/icons/chat_bubble.png'),
              //   height: size.height * 0.035,
              // ),
              InkWell(
                onTap: () {
                  CartsDialog.show(
                      title: 'Whatsapp Contact?',
                      content:
                          'Do you want to to contact with service provider ?',
                      onYesPress: () async {
                        if (!await launchUrl(customerServiceWhatsapp)) {
                          throw 'Could not lunch $customerServiceWhatsapp';
                        }
                        log('Directed to $customerServiceWhatsapp');
                        Get.back();
                      });
                },
                child: const Icon(
                  Icons.help_outline_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
