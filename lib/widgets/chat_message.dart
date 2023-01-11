import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:whatsapp_clone/extras/extensions.dart';

import '../dummy_model/dummy_model.dart';
import '../extras/app_text_styles.dart';
import '../extras/colors.dart';
import '../extras/constants.dart';
import 'margin_widget.dart';

class ChatMessage extends StatelessWidget {
  DateTime dateTime;

  List<DummyMessage> messages = [];

  late double width;

  ChatMessage({super.key, required this.dateTime}) {
    messages = returnMessages(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    width = context.width;
    return Column(
      children: [
        chatDate(),
        const MarginWidget(),
        for (int i = 0; i < messages.length; i++) ...[
          messageBox(messages[i]),
          const MarginWidget(),
        ]
      ],
    );
  }

  Widget messageBox(DummyMessage message) {
    return Align(
      alignment:
          message.sent == true ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints:  BoxConstraints(maxWidth: width / 1.5),
        decoration: BoxDecoration(
          color: message.sent == true ? CColors.msgBox.withOpacity(0.8) : CColors.lightGrey.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  message.message,
                  textAlign: TextAlign.start,
                  style: AppTextStyle.robot(
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
              const MarginWidget(isHorizontal: true),
              Text(
                Jiffy(message.dateTime).jm,
                style: AppTextStyle.robot(
                  style: TextStyle(
                    fontSize: 11,
                    color: CColors.time,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const MarginWidget(
                isHorizontal: true,
                factor: 0.2,
              ),
              if (message.sent)
                Icon(
                  Icons.done_all_rounded,
                  size: 18,
                  color: message.read == true
                      ? Colors.blue
                      : Colors.black.withOpacity(0.5),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget chatDate() {
    return Container(
      width: 109,
      height: 34,
      decoration: BoxDecoration(
        color: CColors.lightGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        DateFormat.yMMMd().format(dateTime),
        style: AppTextStyle.robot(
            style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
        )),
      ),
    );
  }

  List<DummyMessage> returnMessages(DateTime dateTime) {
    List<DummyMessage> messageList = [];

    messageList = Constants.dummyMessage
        .where((element) => format(element.dateTime) == format(dateTime))
        .toList();

    return messageList;
  }

  String format(DateTime dateTime) {
    return Jiffy(dateTime).format("yyyy-dd-MM");
  }
}
