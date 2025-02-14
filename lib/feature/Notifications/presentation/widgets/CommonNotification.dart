import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Notifications/presentation/widgets/notificationsettingitem.dart';

class Commonnotification extends StatelessWidget {
  const Commonnotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Common",
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff202244)),
        ),
        Notificationsettingitem(
          title: 'General Notification',
        ),
        Notificationsettingitem(
          title: 'Sound',
        ),
        Notificationsettingitem(
          title: 'Vibrate',
        ),
      ],
    );
  }
}
