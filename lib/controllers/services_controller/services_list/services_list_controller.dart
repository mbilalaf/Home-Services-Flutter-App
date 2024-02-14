import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_services/models/services_list_model.dart';

class ServicesListController extends GetxController {
  RxList<ServicesListModel> servicesList = <ServicesListModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchServicesList();
  }

  Future<void> fetchServicesList() async {
    isLoading.value = true;
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('Services List').get();
      print('Run');
      if (snapshot.docs.isNotEmpty) {
        servicesList.assignAll(
          snapshot.docs
              .map((doc) => ServicesListModel.fromMap(doc.data()))
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
