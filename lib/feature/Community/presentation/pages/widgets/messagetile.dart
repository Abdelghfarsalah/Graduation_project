import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Community/domain/modelCommunity/MessageModel.dart';
import 'package:graduation_project/feature/Community/presentation/pages/widgets/OtherMessages.dart';
import 'package:graduation_project/feature/Community/presentation/pages/widgets/my_message.dart';

class Messagetile extends StatelessWidget {
  const Messagetile({super.key, required this.msg});
  final MessageModel msg;
  final String userId = "681661157354da31fbcca232";
  @override
  Widget build(BuildContext context) {
    bool isMe = msg.sender.id == userId; // افترض إن عندك id في الموديل

    return isMe ? MyMessage(msg: msg) : Othermessage(msg: msg);
  }
}
