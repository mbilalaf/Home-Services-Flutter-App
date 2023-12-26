import 'package:flutter/material.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/widgets/button.dart';
import 'package:home_services/widgets/textfield.dart';

class SelectLocationPage extends StatelessWidget {
  const SelectLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController cityController = TextEditingController();
    TextEditingController apartmentController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Image(
                        height: 48,
                        image: AssetImage(
                          "assets/icons/menu.png",
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: MyColors.lightGray,
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Your Location",
                    style: MyFontStyle.largeText.copyWith(
                      fontSize: 40,
                      color: MyColors.white,
                    ),
                  ),
                ],
              ),
            ),
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
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      MyTextfield(
                        textEditingController: apartmentController,
                        hintText: "895 Ciara Mission",
                        prefixIcon: Icons.location_on,
                      ),
                      const SizedBox(height: 24),
                      MyTextfield(
                        textEditingController: cityController,
                        hintText: "New York",
                        prefixIcon: Icons.location_on,
                      ),
                      const SizedBox(height: 24),
                      MyTextfield(
                        textEditingController: phoneController,
                        hintText: "53943-9414",
                        prefixIcon: Icons.location_on,
                      ),
                      const SizedBox(height: 24),
                      Container(
                        height: 230,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: MyColors.lightGray,
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      const SizedBox(height: 40),
                      MyButton(
                        btnText: "Submit Location",
                        onTap: () {},
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
