import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Notifications/presentation/widgets/notificationsettingitem.dart';

class Others extends StatelessWidget {
  const Others({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Others",
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff202244)),
        ),
        Notificationsettingitem(
          title: 'New Service Available',
        ),
        Notificationsettingitem(
          title: 'New Tips Available',
        ),
      ],
    );
  }
}
