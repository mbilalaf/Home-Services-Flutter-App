import 'package:flutter/material.dart';
import 'package:home_services/controllers/messages_controller/messages_controller.dart';
import 'package:home_services/utils/colors.dart';

class ChatTextField extends StatelessWidget {
  final ScrollController scrollController;

  ChatTextField({super.key, required this.scrollController});

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                    hintText: 'Type Something...',
                    hintStyle: TextStyle(color: MyColors.primaryColor),
                    border: InputBorder.none),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
          ),
        ),
        MaterialButton(
          minWidth: 0,
          color: MyColors.primaryColor,
          onPressed: () {
            if (textEditingController.text.isNotEmpty) {
              MessagesController.sendMessage(textEditingController.text);
              // Scroll to the bottom when a new message is sent
              // Delay the scroll operation to ensure the UI is updated
              Future.delayed(const Duration(milliseconds: 100), () {
                scrollController.animateTo(
                  scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              });
            } else {
              print('Enter Your MEssage');
            }
            textEditingController.text = '';
          },
          shape: const CircleBorder(),
          child: const Icon(
            Icons.send,
            color: MyColors.white,
          ),
        )
      ],
    );
  }
}
