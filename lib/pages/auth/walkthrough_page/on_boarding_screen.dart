import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/auth/signin_signup_pages/sign_in_page.dart';

import 'intro_widget.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  int _activePage = 0;

  void onNextPage() {
    if (_activePage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    } else {
      Get.offAll(() => SignInPage());
    }
  }

  @override
  void initState() {
    _indicatorsTrue(_activePage);
    super.initState();
  }

  final List<Map<String, dynamic>> _pages = [
    {
      'color': '#5B7FFF',
      'title': 'Find a Doctor',
      'image': 'assets/images/img-1.png',
      'description':
          "Discover and connect with trusted doctors online and in-clinic for convenient and personalized care.",
      'skip': true
    },
    {
      'color': '#5B7FFF',
      'title': 'Lab Tests Discounts',
      'image': 'assets/images/img-2.png',
      'description':
          'Save on lab tests with exclusive discounts.compare prices across labs’ and enjoy the convenience of home',
      'skip': true
    },
    {
      'color': '#5B7FFF',
      'title': 'Medicines Made Easy',
      'image': 'assets/images/img-1.png',
      'description':
          'Access medications hassle - free with discounts, home delivery, and convenient subscription plans.',
      'skip': false
    },
    {
      'color': '#5B7FFF',
      'title': 'Weight Loss Clinic',
      'image': 'assets/images/img-2.png',
      'description':
          'Achieve health goals with expert guidance, personalized programs, ongoing support, and a monthly quarterly',
      'skip': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                scrollBehavior: AppScrollBehavior(),
                onPageChanged: (int page) {
                  setState(() {
                    _activePage = page;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return IntroWidget(
                    activePage: _activePage,
                    pages: _pages,
                    index: index,
                    color: _pages[index]['color'],
                    title: _pages[index]['title'],
                    description: _pages[index]['description'],
                    image: _pages[index]['image'],
                    skip: _pages[index]['skip'],
                    onTab: onNextPage,
                  );
                }),
          ],
        ),
      ),
    );
  }
}

List<Widget> buildIndicator(int activePage, List<Map<String, dynamic>> pages) {
  final indicators = <Widget>[];

  for (var i = 0; i < pages.length; i++) {
    if (activePage == i) {
      indicators.add(_indicatorsTrue(activePage));
    } else {
      indicators.add(_indicatorsFalse());
    }
  }
  return indicators;
}

Widget _indicatorsTrue(int activePage) {
  final String color;
  if (activePage == 0) {
    color = '#5B7FFF';
  } else if (activePage == 1) {
    color = '#5B7FFF';
  } else {
    color = '#5B7FFF';
  }

  return AnimatedContainer(
    duration: const Duration(microseconds: 300),
    height: 6,
    width: 42,
    margin: const EdgeInsets.only(right: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: hexToColor(color),
    ),
  );
}

Widget _indicatorsFalse() {
  return AnimatedContainer(
    duration: const Duration(microseconds: 300),
    height: 8,
    width: 8,
    margin: const EdgeInsets.only(right: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.grey.shade300,
    ),
  );
}
