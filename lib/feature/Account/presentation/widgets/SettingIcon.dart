import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/Account/presentation/pages/SettingPage.dart';

class Settingicon extends StatelessWidget {
  const Settingicon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 50.h,
        left: MediaQuery.of(context).size.width * 0.85,
        right: 20.w,
        child: GestureDetector(
            onTap: () {
              Animationsforpages.navigateWithSlidepush(context, Settingpage());
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Settingpage()));
            },
            child: Image.asset("assets/HomeImage/Accountimages/Setting.png")));
  }
}
