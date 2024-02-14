import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/controllers/add_to_cart_controller/add_to_cart_controller.dart';
import 'package:home_services/controllers/add_to_cart_controller/cart_services_controller/cart_services_controller.dart';
import 'package:home_services/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'remove_items_dialoug.dart';

Future<void> whatsappBottomSheet(Uri muhammadWA, asifWA,
    {int? index, bool isCart = false}) {
  final GlobalKey bottomSheetKey = GlobalKey();
  AddToCartController addToCartController = Get.put(AddToCartController());
  CartServiceDetailsController cartServiceDetailsController =
      Get.put(CartServiceDetailsController());
  return Get.bottomSheet(
    Container(
      key: bottomSheetKey,
      height: Get.height * 0.2,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 16.0),
            child: Container(
              height: 6,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            ),
          ),
          InkWell(
              onTap: () async {
                Get.back();
                try {
                  await CartsDialog.show(
                      title: 'Whatsapp Contact?',
                      content:
                          'Do you want to to contact with service provider ?',
                      onYesPress: () async {
                        if (!await launchUrl(muhammadWA)) {
                          throw 'Could not lunch $muhammadWA';
                        }
                        log('Directed to $muhammadWA');
                        isCart
                            ? addToCartController.removeFromCartById(
                                cartServiceDetailsController
                                    .serviceDetailsList[index!].docID)
                            : null;
                      });
                  // Get.back();
                } catch (e) {
                  print('Error: $e');
                }
              },
              child: const Row(
                children: [
                  Image(
                    image: AssetImage('assets/icons/whatsapp.png'),
                    height: 40,
                  ),
                  SizedBox(
                    width: 08,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Worker',
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      Text('+923348328351',
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                Get.back();
                try {
                  CartsDialog.show(
                      title: 'Whatsapp Contact?',
                      content:
                          'Do you want to to contact with service provider ?',
                      onYesPress: () async {
                        if (!await launchUrl(asifWA)) {
                          throw 'Could not lunch $asifWA';
                        }
                        log('Directed to $asifWA');
                        isCart
                            ? addToCartController.removeFromCartById(
                                cartServiceDetailsController
                                    .serviceDetailsList[index!].docID)
                            : null;
                        Get.back();
                      });
                } catch (e) {
                  print('Error: $e');
                }
              },
              child: const Row(
                children: [
                  Image(
                    image: AssetImage('assets/icons/whatsapp.png'),
                    height: 40,
                  ),
                  Text(
                    '',
                    style: TextStyle(fontSize: 18, color: MyColors.phoneGreen),
                  ),
                  SizedBox(
                    width: 08,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Customer Service',
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      Text('+923480051552',
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ],
              )),
        ],
      ),
    ),
    backgroundColor: Colors.white,
    isDismissible: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
