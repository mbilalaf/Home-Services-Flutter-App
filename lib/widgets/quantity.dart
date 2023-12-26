import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:home_services/controllers/cart_controller.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';

class Quantity extends StatefulWidget {
  final int index;

  const Quantity({super.key, required this.index});

  @override
  State<Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  CartController controller = Get.put(CartController());
  CartController controller2 = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            controller.decrementItem();
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color: MyColors.lightGray.withOpacity(0.25),
            ),
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.minus,
                color: MyColors.darkGray,
                size: 14,
              ),
            ),
          ),
        ),
        Container(
          height: 30,
          width: 40,
          decoration: BoxDecoration(
            color: MyColors.white.withOpacity(0.25),
            border: Border.all(
              color: MyColors.darkGray.withOpacity(0.1),
            ),
          ),
          child: Obx(
            () => Center(
              child: Text(
                "${(controller.itemCount1)}",
                style: MyFontStyle.tilteText,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.index.isEven
                ? controller.incrementItem()
                : controller2.incrementItem2();
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: MyColors.lightGray.withOpacity(0.25),
            ),
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.plus,
                color: MyColors.darkGray,
                size: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
