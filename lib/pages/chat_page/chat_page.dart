import 'package:flutter/material.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/widgets/appbar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Column(
        children: [
          const Expanded(
            child: MyAppBar(title: "Gilbert Boone"),
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
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 24,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: MyColors.lightGray,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      height: 14,
                                      width: 14,
                                      decoration: BoxDecoration(
                                        color: MyColors.green,
                                        borderRadius: BorderRadius.circular(24),
                                        border: Border.all(
                                          color: MyColors.white,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: index == 2
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                                  children: const [
                                    Card(
                                      surfaceTintColor: MyColors.white,
                                      color: MyColors.white,
                                      elevation: 2,
                                      child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Text(
                                          "Hello, We are looking for some electrician to provide affordable services.",
                                          style: MyFontStyle.mediumText,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "03:43PM",
                                      style: MyFontStyle.smallText,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
