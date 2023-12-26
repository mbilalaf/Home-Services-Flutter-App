import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/auth/signin_signup_pages/sign_in_page.dart';

import 'on_boarding_screen.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    super.key,
    required this.color,
    required this.title,
    required this.description,
    required this.skip,
    required this.image,
    required this.activePage,
    required this.pages,
    required this.onTab,
    required this.index,
  });

  final String color;
  final int activePage;
  final List<Map<String, dynamic>> pages;
  final String title;
  final String description;
  final bool skip;
  final String image;
  final VoidCallback onTab;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: hexToColor(color),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30, left: 24),
                height: MediaQuery.of(context).size.height / 20,
                width: MediaQuery.of(context).size.width / 1.7,
                decoration: const BoxDecoration(
                    //    color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage("assets/images/review.png"),
                        fit: BoxFit.contain)),
              ),
              Container(
                height: index == 0
                    ? MediaQuery.of(context).size.height / 1.9
                    : index == 1
                        ? MediaQuery.of(context).size.height / 2.2
                        : MediaQuery.of(context).size.height / 2.5,
                width: index == 2
                    ? Get.width * 0.9
                    : MediaQuery.of(context).size.height,
                margin: const EdgeInsets.only(
                  left: 25,
                ),
                decoration: BoxDecoration(
                    //    color: Colors.red,
                    image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.contain,
                )),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.45,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                          fontSize: 16.3,
                          height: 1.2,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.3,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: buildIndicator(
                      activePage,
                      pages,
                    ))
              ],
            ),
          ),
          Positioned(
            bottom: 55,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: 46,
                child: MaterialButton(
                  color: hexToColor(color),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: onTab,
                  child:
                      const Text('Next', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: InkWell(
                onTap: () {
                  Get.offAll(() => const SignInPage());
                },
                child: const SizedBox(
                  height: 46,
                  child: Center(
                      child: Text('Quickly explore the app? Tap here',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              decoration: TextDecoration.underline))),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.4,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                // color: Colors.black.withOpacity(0.6),
                image: DecorationImage(
                    image: AssetImage("assets/images/review.png"),
                    fit: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
