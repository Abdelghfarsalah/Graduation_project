import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/Account/presentation/pages/Editpage.dart';
import 'package:graduation_project/feature/Account/presentation/pages/SettingPages/PrivacyPage.dart';
import 'package:graduation_project/feature/Account/presentation/pages/SettingPages/SecurityPage.dart';
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
              fontSize: 16.sp,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10.h,
        ),
        Settingcard(
            title: "Edit profile",
            icon: Icon(FontAwesomeIcons.user),
            onTap: () async {
              var name = await SharedPreferencesDemo.getUserName();
              // print(name);
              Animationsforpages.navigateWithSlidepush(
                  context,
                  EditNamePage(
                    initialName: name,
                  ));
            }),
        Settingcard(
            title: "security",
            icon: Icon(Icons.security),
            onTap: () {
              Animationsforpages.navigateWithSlidepush(context, SecurityPage());
            }),
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
            onTap: () {
              Animationsforpages.navigateWithSlidepush(context, PrivacyPage());
            })
      ],
    );
  }
}
