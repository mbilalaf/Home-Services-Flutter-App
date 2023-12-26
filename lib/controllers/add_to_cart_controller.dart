// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// // class AddToCartController extends GetxController {
// //   RxList<String> cartItems = <String>[].obs;
// //
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// //
// //   void addToCart(String item) {
// //     // Check if the item already exists in the cart
// //     if (cartItems.contains(item)) {
// //       // Show a snackbar or any other notification
// //       Get.snackbar(
// //         'Item Exists',
// //         'This item is already in your cart',
// //         snackPosition: SnackPosition.BOTTOM,
// //         colorText: Colors.white,
// //         padding: EdgeInsets.all(10),
// //         backgroundColor: Colors.black,
// //       );
// //     } else {
// //       // If the item is not in the cart, add it
// //       cartItems.add(item);
// //       // Update the cart in Firebase
// //       _updateCartInFirebase();
// //     }
// //     //
// //     // cartItems.add(item);
// //     // _updateCartInFirebase();
// //   }
// //
// //   void removeFromCart(int index) {
// //     cartItems.removeAt(index);
// //     _updateCartInFirebase();
// //   }
// //
// //   void clearCart() {
// //     cartItems.clear();
// //     _updateCartInFirebase();
// //   }
// //
// //   Future<void> _updateCartInFirebase() async {
// //     // Assuming you have a user ID for the logged-in user
// //     String userId = FirebaseAuth
// //         .instance.currentUser!.uid; // Replace with your user ID logic
// //
// //     try {
// //       await _firestore.collection('users').doc(userId).update({
// //         'cartItems': cartItems.toList(),
// //       });
// //     } catch (e) {
// //       print("Error updating cart in Firebase: $e");
// //     }
// //   }
// //
// //   Future<void> fetchCartFromFirebase() async {
// //     // Assuming you have a user ID for the logged-in user
// //     String userId = FirebaseAuth
// //         .instance.currentUser!.uid; // Replace with your user ID logic
// //
// //     try {
// //       final DocumentSnapshot<Map<String, dynamic>> userDoc =
// //           await _firestore.collection('users').doc(userId).get();
// //
// //       if (userDoc.exists) {
// //         List<String> savedCart =
// //             List<String>.from(userDoc.data()?['cartList'] ?? []);
// //
// //         cartItems.assignAll(savedCart);
// //       }
// //     } catch (e) {
// //       print("Error fetching cart from Firebase: $e");
// //     }
// //   }
// // }
//
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
//
// class AddToCartController extends GetxController {
//   RxList<String> cartItems = <String>[].obs;
//
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   void addToCart(String item) {
//     // Check if the item already exists in the cart
//     if (cartItems.contains(item)) {
//       // Show a snackbar or any other notification
//       Get.snackbar(
//         'Item Exists',
//         'This item is already in your cart',
//         snackPosition: SnackPosition.BOTTOM,
//         colorText: Colors.white,
//         padding: EdgeInsets.all(10),
//         backgroundColor: Colors.black,
//       );
//     } else {
//       // If the item is not in the cart, add it
//       cartItems.add(item);
//       // Update the cart in Firebase
//       _updateCartInFirebase();
//     }
//   }
//
//   void removeFromCart(int index) {
//     print('removed-------------------');
//     cartItems.removeAt(index);
//     _updateCartInFirebase();
//     print('----------------removed');
//   }
//
//   void clearCart() {
//     cartItems.clear();
//     _updateCartInFirebase();
//   }
//
//   Future<void> _updateCartInFirebase() async {
//     // Assuming you have a user ID for the logged-in user
//     String userId = FirebaseAuth
//         .instance.currentUser!.uid; // Replace with your user ID logic
//
//     try {
//       // Fetch the existing cartItems from Firestore
//       final DocumentSnapshot<Map<String, dynamic>> userDoc =
//           await _firestore.collection('users').doc(userId).get();
//
//       List<String> existingCart =
//           List<String>.from(userDoc.data()?['cartList'] ?? []);
//
//       // Add the new item to the existing cartItems
//       existingCart.addAll(cartItems);
//
//       // Remove duplicates (optional, depending on your requirements)
//       existingCart = existingCart.toSet().toList();
//
//       // Update the Firestore document with the updated cartItems
//       await _firestore.collection('users').doc(userId).update({
//         'cartList': existingCart,
//       });
//     } catch (e) {
//       print("Error updating cart in Firebase: $e");
//     }
//   }
//
//   Future<void> fetchCartFromFirebase() async {
//     // Assuming you have a user ID for the logged-in user
//     String userId = FirebaseAuth
//         .instance.currentUser!.uid; // Replace with your user ID logic
//
//     try {
//       final DocumentSnapshot<Map<String, dynamic>> userDoc =
//           await _firestore.collection('users').doc(userId).get();
//
//       if (userDoc.exists) {
//         List<String> savedCart =
//             List<String>.from(userDoc.data()?['cartList'] ?? []);
//
//         cartItems.assignAll(savedCart);
//       }
//     } catch (e) {
//       print("Error fetching cart from Firebase: $e");
//     }
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class AddToCartController extends GetxController {
//   RxList<String> cartItems = <String>[].obs;
//
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   void addToCart(String item) {
//     // Check if the item already exists in the cart
//     if (cartItems.contains(item)) {
//       // Show a snackbar or any other notification
//       Get.snackbar(
//         'Item Exists',
//         'This item is already in your cart',
//         snackPosition: SnackPosition.BOTTOM,
//         colorText: Colors.white,
//         padding: EdgeInsets.all(10),
//         backgroundColor: Colors.black,
//       );
//     } else {
//       // If the item is not in the cart, add it
//       cartItems.add(item);
//       // Update the cart in Firebase
//       _updateCartInFirebase();
//     }
//   }
//
//   void removeFromCart(int index) {
//     print('removed-------------------');
//     cartItems.removeAt(index);
//     _updateCartInFirebase();
//     print('----------------removed');
//   }
//
//   void clearCart() {
//     cartItems.clear();
//     _updateCartInFirebase();
//   }
//
//   Future<void> _updateCartInFirebase() async {
//     // Assuming you have a user ID for the logged-in user
//     String userId = FirebaseAuth.instance.currentUser!.uid;
//
//     try {
//       // Fetch the existing cartItems from Firestore
//       final DocumentSnapshot<Map<String, dynamic>> userDoc =
//           await _firestore.collection('users').doc(userId).get();
//
//       List<String> existingCart =
//           List<String>.from(userDoc.data()?['cartList'] ?? []);
//
//       // Remove the items that were removed locally
//       existingCart.removeWhere((item) => !cartItems.contains(item));
//
//       // Add the new items to the existing cartItems
//       existingCart.addAll(cartItems);
//
//       // Remove duplicates (optional, depending on your requirements)
//       existingCart = existingCart.toSet().toList();
//
//       // Update the Firestore document with the updated cartItems
//       await _firestore.collection('users').doc(userId).update({
//         'cartList': existingCart,
//       });
//     } catch (e) {
//       print("Error updating cart in Firebase: $e");
//     }
//   }
//
//   Future<void> fetchCartFromFirebase() async {
//     // Assuming you have a user ID for the logged-in user
//     String userId = FirebaseAuth.instance.currentUser!.uid;
//
//     try {
//       final DocumentSnapshot<Map<String, dynamic>> userDoc =
//           await _firestore.collection('users').doc(userId).get();
//
//       if (userDoc.exists) {
//         List<String> savedCart =
//             List<String>.from(userDoc.data()?['cartList'] ?? []);
//
//         cartItems.assignAll(savedCart);
//       }
//     } catch (e) {
//       print("Error fetching cart from Firebase: $e");
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/controllers/my_button_controller.dart';
import 'package:home_services/utils/colors.dart';

class AddToCartController extends GetxController {
  RxList<String> cartItems = <String>[].obs;
  RxBool isDone = false.obs; // Use RxBool for reactivity
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static AddToCartController get to => Get.find<AddToCartController>();
  final MyButtonController myButtonController = MyButtonController();

  void addToCart(String item) {
    // Check if the item already exists in the cart
    if (cartItems.contains(item)) {
      // Show a snackbar or any other notification
      Get.snackbar(
        'Item Exists',
        'This item is already in your cart',
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        padding: EdgeInsets.all(10),
        backgroundColor: MyColors.primaryColor,
      );
    } else {
      // If the item is not in the cart, add it
      cartItems.add(item);
      // Update the cart in Firebase
      _updateCartInFirebase();
    }
  }

  void clearCart() {
    cartItems.clear();
    _updateCartInFirebase();
  }

  Future<void> _updateCartInFirebase() async {
    // Assuming you have a user ID for the logged-in user
    String userId = FirebaseAuth.instance.currentUser!.uid;
    try {
      myButtonController.isLoading.value = true;
      // Update the Firestore document with the updated cartItems
      await _firestore.collection('users').doc(userId).update({
        'cartList': FieldValue.arrayUnion(cartItems),
      }).whenComplete(
        () {
          Get.snackbar(
            'Success',
            'Cart is Successfully added',
            snackPosition: SnackPosition.TOP,
            snackStyle: SnackStyle.FLOATING,
            colorText: Colors.white,
            padding: EdgeInsets.all(10),
            backgroundColor: MyColors.primaryColor,
          );
          myButtonController.isLoading.value = false;
        },
      ).onError(
        (error, stackTrace) {
          Get.snackbar(
            'Error',
            error.toString(),
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            padding: EdgeInsets.all(10),
            backgroundColor: MyColors.primaryColor,
          );
        },
      );
      myButtonController.isLoading.value = false;
      // Get.to(() => CartPage());
      myButtonController.isLoading.value = false;
    } catch (e) {
      print("Error updating cart in Firebase: $e");
      myButtonController.isLoading.value = false;
    }
  }

  Future<void> removeFromCartById(String itemId) async {
    // Check if the item exists in the cart
    isDone.value = true;
    if (cartItems.contains(itemId)) {
      cartItems.remove(itemId);
      update(); // Trigger UI update
    }

    // Assuming you have a user ID for the logged-in user
    String userId = FirebaseAuth.instance.currentUser!.uid;

    try {
      // Use transaction to ensure atomic updates
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        // Fetch the existing cartItems from Firestore
        DocumentSnapshot<Map<String, dynamic>> userDoc =
            await _firestore.collection('users').doc(userId).get();

        List<String> existingCart =
            List<String>.from(userDoc.data()?['cartList'] ?? []);

        // Remove the item with the specified itemId
        existingCart.remove(itemId);

        // Update the Firestore document with the updated cartItems
        // transaction.update(
        //   _firestore.collection('users').doc(userId),
        //   {'cartList': FieldValue.arrayRemove(existingCart)},
        // );
        transaction.update(
          _firestore.collection('users').doc(userId),
          {'cartList': existingCart},
        );
      });
      isDone.value = false;
    } catch (e) {
      print("Error removing item from cart in Firebase: $e");
      isDone.value = false;
    }
  }

  Future<void> fetchCartFromFirebase() async {
    // Assuming you have a user ID for the logged-in user
    String userId = FirebaseAuth.instance.currentUser!.uid;
    myButtonController.isLoading.value = true;
    try {
      final DocumentSnapshot<Map<String, dynamic>> userDoc =
          await _firestore.collection('users').doc(userId).get();

      if (userDoc.exists) {
        List<String> savedCart =
            List<String>.from(userDoc.data()?['cartList'] ?? []);

        cartItems.assignAll(savedCart);
        myButtonController.isLoading.value = false;
      }
    } catch (e) {
      print("Error fetching cart from Firebase: $e");
      myButtonController.isLoading.value = false;
    }
  }
}
