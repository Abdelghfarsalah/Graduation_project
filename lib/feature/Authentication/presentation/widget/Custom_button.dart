import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onTap,
      required this.color,
      required this.width,
      required this.text,
      required this.endcolor,
      required this.borderRadius});
  final void Function() onTap;
  final Color color;
  final Color endcolor;
  final double width;
  final String text;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              color,
              endcolor,
            ]),
            color: color,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontFamily: appFonts.Poppins,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}
