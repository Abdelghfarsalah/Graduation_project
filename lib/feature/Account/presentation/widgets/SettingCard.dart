import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';

class Settingcard extends StatelessWidget {
  const Settingcard(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});
  final String title;
  final Icon icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        width: double.infinity,
        color: Color(0xffF4F4F7),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontFamily: appFonts.Poppins,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600),
          ),
          leading: icon,
        ),
      ),
    );
  }
}
