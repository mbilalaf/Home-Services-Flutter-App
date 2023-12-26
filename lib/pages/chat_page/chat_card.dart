import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_services/models/messages_page_model.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';

class ChatCard extends StatefulWidget {
  final Messages messages;

  const ChatCard({super.key, required this.messages});

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser!.uid != widget.messages.fromid
        ? sender()
        : receiverCard();
  }

  Widget sender() {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: MyColors.lightGray,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                height: 10,
                width: 10,
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
        const SizedBox(width: 5),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                surfaceTintColor: MyColors.white,
                color: MyColors.white,
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    widget.messages.message,
                    style: MyFontStyle.mediumText,
                  ),
                ),
              ),
              Text(
                widget.messages.sendtime,
                style: MyFontStyle.smallText,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget receiverCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Card(
                surfaceTintColor: MyColors.white,
                color: MyColors.white,
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    widget.messages.message,
                    style: MyFontStyle.mediumText,
                  ),
                ),
              ),
              Text(
                widget.messages.sendtime.toString(),
                style: MyFontStyle.smallText,
              ),
            ],
          ),
        ),
        const SizedBox(width: 5),
        Stack(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: MyColors.lightGray,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                height: 10,
                width: 10,
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
      ],
    );
  }
}
