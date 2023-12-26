import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:home_services/models/admin_model.dart';

class AdminController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxList<AdminModel> admin = <AdminModel>[].obs;
  RxString adminName = ''.obs;
  RxString documentId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getAdmin();
  }

  Future<void> getAdmin() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firestore.collection('Admin').limit(1).get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            querySnapshot.docs.first;

        // Get the document ID
        documentId.value = snapshot.id;

        // Access other fields
        adminName.value = snapshot.data()?['name'] ?? '';

        // Do something with the document ID and other data
        print('Document ID: $documentId');
        print('Admin Name: $adminName');
      } else {
        // No documents found
        print('No documents found');
      }
    } catch (e) {
      print('Error Message: $e');
    }
  }

// Future<void> getAdmin() async {
//   try {
//     DocumentSnapshot<Map<String, dynamic>> snapshot =
//         await firestore.collection('Admin').doc('your_document_id').get();
//
//     if (snapshot.exists) {
//       adminName.value = snapshot.data()?['name'] ?? '';
//     }
//     print('List Length: ${admin.length}');
//   } catch (e) {
//     print('Error Message: $e}');
//   }
// }
}
