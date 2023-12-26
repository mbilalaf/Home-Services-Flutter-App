import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/auth/walkthrough_page/walkthrough_model.dart';
import 'package:home_services/pages/auth/welcome_page/welcome_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/widgets/button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalkthroughPage extends StatefulWidget {
  const WalkthroughPage({super.key});

  @override
  State<WalkthroughPage> createState() => _WalkthroughPageState();
}

class _WalkthroughPageState extends State<WalkthroughPage> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                child: SizedBox(
                  height: 540,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: walkthroughList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  walkthroughList[index].img,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 24),
                            child: Text(
                              maxLines: 3,
                              walkthroughList[index].text,
                              style: MyFontStyle.mediumText,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: const SlideEffect(
                        spacing: 8.0,
                        radius: 10.0,
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 3,
                        dotColor: MyColors.primaryColor,
                        activeDotColor: MyColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 50),
                    MyButton(
                      btnText: "Start Exploring",
                      onTap: () => Get.to(const WelcomePage()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<WalkthroughModel> walkthroughList = [
  WalkthroughModel(
      color: MyColors.lightGray,
      text:
          "Our Expert Services Providers\nare always ready to offer you\nreliable and affordable services.",
      img: 'assets/images/img-1.png'),
  WalkthroughModel(
    color: MyColors.primaryColor,
    text: "Our Expert Services Providers\nare always ready to offer you",
    img: 'assets/images/img-2.png',
  ),
  WalkthroughModel(
    color: MyColors.darkGray,
    text: "are always ready to offer you\nreliable and affordable services.",
    img: 'assets/images/img-3.png',
  ),
  WalkthroughModel(
    color: MyColors.green,
    text: "are always ready to offer you\nreliable and affordable services.",
    img: 'assets/images/img-4.png',
  ),
];
