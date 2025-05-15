import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Community/domain/modelCommunity/MessageModel.dart';

class MyMessage extends StatelessWidget {
  const MyMessage({super.key, required this.msg});
  final MessageModel msg;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   msg.sender.name,
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold, color: Colors.white),
                // ),
                // const SizedBox(height: 4),
                Text(
                  msg.content,
                  style: TextStyle(color: Colors.white),
                ),
                if (msg.image != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Image.network(msg.image!, height: 150),
                  ),
              ],
            ),
          ),
        ));
  }
}
