import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/feature/Community/domain/modelCommunity/MessageModel.dart';
import 'package:graduation_project/feature/Community/presentation/pages/widgets/OtherMessages.dart';
import 'package:graduation_project/feature/Community/presentation/pages/widgets/my_message.dart';

class Messagetile extends StatefulWidget {
  const Messagetile({super.key, required this.msg});
  final MessageModel msg;

  @override
  State<Messagetile> createState() => _MessagetileState();
}

class _MessagetileState extends State<Messagetile> {
  String? userId;

  void getUserId() async {
    final id = await SharedPreferencesDemo.getUserId();
    setState(() {
      userId = id;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    // إذا لسه userId مش جاهز، ارجع مؤشر تحميل أو SizedBox
    if (userId == null) return const SizedBox();

    bool isMe = widget.msg.sender.id == userId;

    return isMe ? MyMessage(msg: widget.msg) : Othermessage(msg: widget.msg);
  }
}
