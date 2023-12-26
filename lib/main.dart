import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/controllers/add_to_cart_controller.dart';
import 'package:home_services/controllers/my_button_controller.dart';
import 'package:home_services/controllers/signup_controller.dart';
import 'package:home_services/pages/splash%20screen/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyAoyqMU1PT_wXUuF2jU-yi0K_5bvTt2M5g",
            appId: "1:642077202337:android:4eed52b717b824b8115de0",
            messagingSenderId: "642077202337",
            projectId: "home-services-61423",
          ),
        )
      : await Firebase.initializeApp();
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Home Services',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashView(),
      initialBinding: InitialBindings(),
    );
  }
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
    Get.put(MyButtonController());
    Get.put(AddToCartController());

    // Add other controllers or dependencies if needed
  }
}
