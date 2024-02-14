import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../models/services_page_models.dart';

class ServicePageController extends GetxController {
  RxList<ServicesPageModel> menuList = <ServicesPageModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchServices();
  }

  Future<void> fetchServices() async {
    isLoading.value = true;
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('Categories')
          .orderBy('title')
          .get();
      if (snapshot.docs.isNotEmpty) {
        menuList.assignAll(
          snapshot.docs
              .map((doc) => ServicesPageModel.fromMap(doc.data()))
              .toList(),
        );
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print('Error fetching data from Firestore: $e');
    }
  }
}
