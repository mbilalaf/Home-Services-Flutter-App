import 'package:flutter/material.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/widgets/appbar.dart';
import 'package:home_services/widgets/service_card.dart';

class ExpertsPage extends StatelessWidget {
  const ExpertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: Column(
          children: [
            // custom appBar
            const MyAppBar(
              title: 'Experts',
            ),

            // content
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: ServiceCard(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
