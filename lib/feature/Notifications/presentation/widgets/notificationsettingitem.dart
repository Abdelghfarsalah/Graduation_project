import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';

class Notificationsettingitem extends StatefulWidget {
  const Notificationsettingitem({super.key, required this.title});
  final String title;

  @override
  State<Notificationsettingitem> createState() =>
      _NotificationsettingitemState();
}

class _NotificationsettingitemState extends State<Notificationsettingitem> {
  bool light = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000)),
        ),
        Switch(
          value: light,
          activeColor: Colors.white,
          inactiveThumbColor: Colors.white,
          padding: EdgeInsets.all(0),
          inactiveTrackColor: Color(0xffD9D9D9),
          activeTrackColor: appColor.Primarycolor,
          onChanged: (bool value) {
            // This is called when the user toggles the switch.
            setState(() {
              light = value;
            });
          },
        )
      ],
    );
  }
}
