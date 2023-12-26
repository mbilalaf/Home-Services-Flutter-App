import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_services/models/services_list_model.dart';

class CartServiceDetailsController extends GetxController {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<ServicesListModel> serviceDetailsList = <ServicesListModel>[].obs;

  Future<void> fetchServiceDetails(List<String> serviceIds) async {
    serviceDetailsList.clear();

    for (String serviceId in serviceIds) {
      try {
        DocumentSnapshot<Map<String, dynamic>> serviceDoc =
            await _firestore.collection('Services List').doc(serviceId).get();
        // DocumentSnapshot<Map<String, dynamic>> expertsDoc =
        //     await _firestore.collection('Experts').doc(serviceId).get();
        if (serviceDoc.exists) {
          ServicesListModel serviceModel =
              ServicesListModel.fromMap(serviceDoc.data()!);
          // ServicesListModel expertsModel =
          //     ServicesListModel.fromMap(expertsDoc.data()!);
          serviceDetailsList.add(serviceModel);
          // serviceDetailsList.add(expertsModel);
        }
      } catch (e) {
        print("Error fetching service details: $e");
      }
    }
  }
}
