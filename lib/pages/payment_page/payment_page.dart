import 'package:flutter/material.dart';
import 'package:home_services/pages/payment_page/payment_success_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/widgets/appbar.dart';
import 'package:home_services/widgets/button.dart';
import 'package:home_services/widgets/textfield.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController enterCVVCodeController = TextEditingController();
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Column(
        children: [
          const Expanded(
            child: MyAppBar(title: "Payment"),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 24,
                    top: 24,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: MyColors.black.withOpacity(0.1),
                              blurRadius: 35,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Card Number",
                                    style: MyFontStyle.subtitleText,
                                  ),
                                  Text(
                                    "2345 6789 6545",
                                    style: MyFontStyle.mediumText,
                                  ),
                                ],
                              ),
                              Image(
                                color: MyColors.darkGray,
                                image: AssetImage(
                                  "assets/icons/Visa.png",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: MyColors.black.withOpacity(0.1),
                              blurRadius: 35,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Card Number",
                                        style: MyFontStyle.subtitleText,
                                      ),
                                      Text(
                                        "2345 6789 6545",
                                        style: MyFontStyle.mediumText,
                                      ),
                                    ],
                                  ),
                                  Image(
                                    color: MyColors.darkGray,
                                    image: AssetImage(
                                      "assets/icons/Visa.png",
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 24),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Card Owner",
                                        style: MyFontStyle.subtitleText,
                                      ),
                                      Text(
                                        "Kenneth Cook",
                                        style: MyFontStyle.mediumText,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Expire",
                                        style: MyFontStyle.subtitleText,
                                      ),
                                      Text(
                                        "04/24",
                                        style: MyFontStyle.mediumText,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      MyTextfield(
                        textEditingController: enterCVVCodeController,
                        hintText: "Enter CVV Code",
                        prefixIcon: Icons.lock_outline,
                      ),
                      const Spacer(),
                      MyButton(
                        btnText: "Confirm Payment",
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomDialog(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
