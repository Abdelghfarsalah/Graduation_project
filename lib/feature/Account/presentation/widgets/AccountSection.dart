import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/SettingCard.dart';
import 'package:graduation_project/feature/Notifications/presentation/pages/Notificationpages.dart';

class Accountsection extends StatelessWidget {
  const Accountsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Account",
          style: TextStyle(
              color: Colors.black,
              fontFamily: appFonts.Poppins,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10,
        ),
        Settingcard(
            title: "Edit profile",
            icon: Icon(FontAwesomeIcons.user),
            onTap: () {}),
        Settingcard(
            title: "security", icon: Icon(Icons.security), onTap: () {}),
        Settingcard(
            title: "Notifications",
            icon: Icon(FontAwesomeIcons.bell),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Notificationpages()));
            }),
        Settingcard(
            title: "Privacy",
            icon: Icon(Icons.lock_outline_rounded),
            onTap: () {})
      ],
    );
  }
}
