import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/auth/walkthrough_page/walkthrough_model.dart';
import 'package:home_services/pages/auth/welcome_page/welcome_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/imagePath.dart';
import 'package:home_services/utils/statics.dart';
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
    double size = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size * 0.7,
                  child: SizedBox(
                    child: PageView.builder(
                      controller: controller,
                      itemCount: walkthroughList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: size * 0.1,
                            ),
                            Container(
                              height: size * 0.3,
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    walkthroughList[index].img,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size * 0.1,
                            ),
                            Text(
                              maxLines: 3,
                              walkthroughList[index].text,
                              style: MyFontStyle.walkTroughText,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
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
                    SizedBox(height: size * 0.03),
                    MyButton(
                      btnText: Statics.startExploring,
                      onTap: () => Get.to(const WelcomePage()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<WalkthroughModel> walkthroughList = [
  WalkthroughModel(
      color: MyColors.lightGray,
      text: Statics.walkThroughIntro,
      img: ImagePath.imageWalkThrough1),
  WalkthroughModel(
    color: MyColors.primaryColor,
    text: Statics.walkThroughIntro,
    img: ImagePath.imageWalkThrough2,
  ),
  WalkthroughModel(
    color: MyColors.darkGray,
    text: Statics.walkThroughIntro,
    img: ImagePath.imageWalkThrough3,
  ),
  WalkthroughModel(
    color: MyColors.green,
    text: Statics.walkThroughIntro,
    img: ImagePath.imageWalkThrough4,
  ),
];
