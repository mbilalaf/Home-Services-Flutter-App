import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_services/models/expert_page_models.dart';

class ExpertsPageController extends GetxController {
  RxList<ExpertsPageModel> expertsList = <ExpertsPageModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchExperts();
  }

  Future<void> fetchExperts() async {
    isLoading.value = true;
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('Experts').get();
      if (snapshot.docs.isNotEmpty) {
        expertsList.assignAll(
          snapshot.docs
              .map((doc) => ExpertsPageModel.fromMap(doc.data()))
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
