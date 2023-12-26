// ignore_for_file: unrelated_type_equality_checks

import 'package:get/get.dart';

class CartController extends GetxController {
  RxInt itemCount1 = 1.obs;
  RxDouble price1 = 19.09.obs;

  RxInt itemCount2 = 1.obs;
  RxDouble price2 = 25.19.obs;

  // Add more properties for other items if needed

  void incrementItem() {
    itemCount1++;
  }

  void decrementItem() {
    if (itemCount1 > 1) {
      itemCount1--;
    }
  }

  void incrementItem2() {
    itemCount2++;
  }

  void decrementItem2() {
    if (itemCount2 > 1) {
      itemCount2--;
    }
  }
}
