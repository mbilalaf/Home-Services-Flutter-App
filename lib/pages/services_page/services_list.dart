import 'package:flutter/material.dart';
import 'package:home_services/pages/services_page/services.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/widgets/appbar.dart';

class ServicesList extends StatelessWidget {
  String? title;
  ServicesList({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: Column(
          children: [
            // custom appBar
            MyAppBar(
              title: title.toString(),
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
                  child: Services(title: title),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
