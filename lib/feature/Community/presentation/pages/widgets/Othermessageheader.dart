import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/communityHelper.dart';
import 'package:graduation_project/feature/Community/domain/modelCommunity/MessageModel.dart';

class Othermessageheader extends StatefulWidget {
  const Othermessageheader({super.key, required this.msg});
  final MessageModel msg;

  @override
  State<Othermessageheader> createState() => _OthermessageheaderState();
}

class _OthermessageheaderState extends State<Othermessageheader> {
  final List<Color> myColors = [
    Color(0xFF8F9F33),
    Color(0xFF0F9748),
    Color(0xFF7471FF),
    Color(0xFFE0836E),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          Communityhelper.formatDateTime(widget.msg.createdAt),
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 12,
          ),
        ),
        Spacer(),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.4,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              widget.msg.sender.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: myColors[Random().nextInt(4)],
                  fontFamily: appFonts.Poppins),
            ),
          ),
        ),
      ],
    );
  }
}
