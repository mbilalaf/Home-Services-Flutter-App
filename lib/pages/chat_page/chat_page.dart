import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/controllers/admin_controller.dart';
import 'package:home_services/controllers/messages_controller.dart';
import 'package:home_services/models/messages_page_model.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/widgets/appbar.dart';
import 'package:home_services/widgets/chat_textfield.dart';

import 'chat_card.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Messages> m = [];
  AdminController adminController = Get.put(AdminController());
  MessagesController messagesController = Get.put(MessagesController());
  final ScrollController _scrollController = ScrollController();
  List<Messages> messages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollToBottom();
  }

  // void _scrollToBottom() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _scrollController.animateTo(
  //       _scrollController.position.maxScrollExtent,
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.easeOut,
  //     );
  //   });
  // }
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Obx(() {
        return SafeArea(
            child: Column(
          children: [
            MyAppBar(title: adminController.adminName.value),
            Expanded(
              child: Container(
                height: Get.height * .8749,
                width: Get.width,
                decoration: const BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  child: Column(
                    children: [
                      Expanded(
                        child: StreamBuilder(
                          stream: MessagesController.getAllMessage(),
                          builder: (context, snapshot) {
                            print('Build is called?');
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const SizedBox();
                            } else {
                              final data = snapshot.data!.docs;
                              messages = data
                                      .map((e) => Messages.fromJson(e.data()))
                                      .toList() ??
                                  [];
                              if (messages.isEmpty) {
                                return const Center(
                                  child: Text('Say Hii! 👋',
                                      style: TextStyle(fontSize: 20)),
                                );
                              }
                              _scrollToBottom(); // Scroll to the bottom when there are messages
                              print('Data: ${jsonEncode(data[0].data())}');
                              return ListView.builder(
                                controller: _scrollController,
                                itemCount: messages.length,
                                itemBuilder: (context, index) {
                                  print('${messages.length}------------------');
                                  return ChatCard(
                                    messages: messages[index],
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                      ChatTextField(scrollController: _scrollController)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
      }),
    );
  }
}
