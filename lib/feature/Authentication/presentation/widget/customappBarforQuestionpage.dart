import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';

class Customappbarforquestionpage extends StatelessWidget
    implements PreferredSizeWidget {
  const Customappbarforquestionpage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          )),
      title: Text(
        "Sign in",
        style: TextStyle(
            fontFamily: appFonts.Poppins,
            fontSize: 15.sp,
            color: appColor.Primarycolor),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
