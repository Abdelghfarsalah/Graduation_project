import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class Meesageheader extends StatelessWidget {
  const Meesageheader({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 54,
      decoration: const BoxDecoration(
        color: Color(0xffEEEEEE),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: Colors.black),
              child: Center(
                  child: Image(image: AssetImage("assets/Bot/Boticon.png"))),
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: text));
                },
                icon: Icon(
                  Icons.copy,
                  size: 18,
                  color: Color(0xffBDBDBD),
                )),
            IconButton(
              onPressed: () {
                Share.share(text);
              },
              icon: Icon(
                Icons.share,
                size: 18,
                color: Color(0xffBDBDBD),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
