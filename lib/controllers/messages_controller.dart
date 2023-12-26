import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:home_services/controllers/admin_controller.dart';
import 'package:home_services/models/messages_page_model.dart';

class MessagesController extends GetxController {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static AdminController adminController = Get.put(AdminController());
  static String? name = auth.currentUser!.displayName;

  static getConversationId(String id) =>
      auth.currentUser!.uid.hashCode <= id.hashCode
          ? '${auth.currentUser!.uid}_$id'
          : '${id}_${auth.currentUser!.uid}';

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessage() {
    return FirebaseFirestore.instance
        .collection(
            'chats/${getConversationId(adminController.documentId.value)}/messages')
        .snapshots();
  }

  // for sending message
  static Future<void> sendMessage(String msg) async {
    //message sending time (also used as id)
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    String formatTime(DateTime time) {
      String period = 'AM';
      int hour = time.hour;
      if (hour >= 12) {
        period = 'PM';
        if (hour > 12) {
          hour -= 12;
        }
      } else if (hour == 0) {
        hour = 12;
      }

      String minute = time.minute.toString().padLeft(2, '0');

      return '$hour:$minute $period';
    }

    final messageTime = DateTime.now();
    final formattedTime = formatTime(messageTime);
    print(formattedTime); // Output: 10:47 AM

    //message to send
    final Messages message = Messages(
      toid: adminController.documentId.value,
      fromid: auth.currentUser!.uid,
      message: msg,
      sendtime: formattedTime,
      status: true,
      username: name!,
    );

    final ref = FirebaseFirestore.instance.collection(
        'chats/${getConversationId(adminController.documentId.value)}/messages');
    await ref.doc(time).set(message.toJson());
  }

// void listenToMessages() {
//   getAllMessage().listen((QuerySnapshot<Map<String, dynamic>> snapshot) {
//     messages.clear(); // Clear existing data
//     messages
//         .addAll(snapshot.docs.map((doc) => Messages.fromJson(doc.data())));
//   });
// }
}
