import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/SettingCard.dart';

class Supportandaboutsection extends StatelessWidget {
  const Supportandaboutsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Support & About",
          style: TextStyle(
              color: Colors.black,
              fontFamily: appFonts.Poppins,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10,
        ),
        Settingcard(
            title: "My Subscribtion",
            icon: Icon(Icons.subtitles),
            onTap: () {}),
        Settingcard(
            title: "Help & Support",
            icon: Icon(Icons.help_outline_outlined),
            onTap: () {}),
        Settingcard(
            title: "Terms and Policies",
            icon: Icon(Icons.outbond_outlined),
            onTap: () {}),
      ],
    );
  }
}
