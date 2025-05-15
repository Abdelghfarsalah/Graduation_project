import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Community/domain/modelCommunity/MessageModel.dart';

class Othermessage extends StatelessWidget {
  const Othermessage({super.key, required this.msg});
  final MessageModel msg;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (msg.content.isNotEmpty)
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          msg.sender.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          msg.content,
                          style: TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                SizedBox(
                  height: 5,
                ),
                if (msg.image != null)
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Image.network(msg.image!, height: 200),
                    ),
                  ),
              ],
            ),
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.blue,
              child: CircleAvatar(
                radius: 17,
                backgroundImage: NetworkImage(
                  msg.sender.avatar,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
