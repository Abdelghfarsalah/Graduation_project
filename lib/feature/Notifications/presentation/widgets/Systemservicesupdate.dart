import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Notifications/presentation/widgets/notificationsettingitem.dart';

class Systemservicesupdate extends StatelessWidget {
  const Systemservicesupdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "System & services update",
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff202244)),
        ),
        Notificationsettingitem(
          title: 'App updates',
        ),
        Notificationsettingitem(
          title: 'Bill Reminder',
        ),
        Notificationsettingitem(
          title: 'Promotion',
        ),
        Notificationsettingitem(
          title: 'Discount Available',
        ),
        Notificationsettingitem(
          title: 'Payment Request',
        ),
      ],
    );
  }
}
