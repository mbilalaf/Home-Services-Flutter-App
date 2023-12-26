import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/auth/walkthrough_page/walkthrough_page.dart';
import 'package:home_services/pages/menu_page/menu_page.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Get.offAll(
        FirebaseAuth.instance.currentUser != null
            ? const MenuPage()
            : const WalkthroughPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.8,
          width: MediaQuery.sizeOf(context).width * 0.7,
          child:
              const Image(image: AssetImage('assets/images/splash_logo.png'))),
    );
  }
}
