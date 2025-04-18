import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SentCodeForResetPasswordWidget extends StatelessWidget {
  const SentCodeForResetPasswordWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.subtitle,
      required this.Selectemail});
  final String title;
  final Widget icon;
  final String subtitle;
  final bool Selectemail;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 60.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Selectemail
              ? Border.all(
                  color: Color(0xff0050D0),
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 174, 205, 245),
              offset: const Offset(4, 4),
              blurRadius: 10.r,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CircleAvatar(
                radius: 22.r,
                backgroundColor: const Color.fromARGB(255, 191, 218, 254),
                child: icon,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins", // تأكد من إضافة الخط في pubspec.yaml
                    color: const Color(0xff0050D0),
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "Poppins",
                    color: const Color(0xffACADB9),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
