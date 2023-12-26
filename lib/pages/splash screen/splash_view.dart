import 'package:flutter/material.dart';
import 'package:home_services/pages/splash%20screen/layout/splash_body.dart';
import 'package:home_services/utils/colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.sizeOf(context).height * 1,
          width: MediaQuery.sizeOf(context).width * 1,
          decoration: const BoxDecoration(
            color: MyColors.primaryColor,
          ),
          child: const SplashBody()),
    );
  }
}
