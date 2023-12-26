import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/pages/account_page/account_page.dart';
import 'package:home_services/pages/chat_page/chat_page.dart';
import 'package:home_services/pages/experts_page/expert_page.dart';
import 'package:home_services/pages/menu_page/models/menu_model.dart';
import 'package:home_services/pages/notifications_page/notification_page.dart';
import 'package:home_services/pages/person_page/peron_page.dart';
import 'package:home_services/pages/services_page/services_page.dart';
import 'package:home_services/pages/settings_page/settings_page.dart';
import 'package:home_services/pages/wallet_page/wallet_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  MenuController controller = Get.put(MenuController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Image(
                        height: 42,
                        image: AssetImage(
                          "assets/icons/menu.png",
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: MyColors.lightGray,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: MyColors.lightGray,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: MyColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: myList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => pages[index]);
                      },
                      child: Column(
                        children: [
                          Image(
                            height: 24,
                            image: AssetImage(
                              myList[index].img,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            maxLines: 2,
                            myList[index].name,
                            style: MyFontStyle.mediumText,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> pages = [
  const PersonPage(),
  const ServicesPage(),
  const SettingsPage(),
  const AccountPage(),
  const ExpertsPage(),
  const WalletPage(),
  const ChatPage(),
  const NotificationPage(),
  const NotificationPage(),
];

List<MenuModel> myList = [
  MenuModel(img: 'assets/icons/person.png', name: "Person"),
  MenuModel(img: 'assets/icons/services.png', name: "Services"),
  MenuModel(img: 'assets/icons/settings.png', name: "Settings"),
  MenuModel(img: 'assets/icons/bag.png', name: "Account"),
  MenuModel(img: 'assets/icons/experts.png', name: "Experts"),
  MenuModel(img: 'assets/icons/wallet.png', name: "Wallet"),
  MenuModel(img: 'assets/icons/email.png', name: "Chat"),
  MenuModel(img: 'assets/icons/notification.png', name: "Notifications"),
  MenuModel(img: 'assets/icons/sign-out.png', name: "Sign Out"),
];
