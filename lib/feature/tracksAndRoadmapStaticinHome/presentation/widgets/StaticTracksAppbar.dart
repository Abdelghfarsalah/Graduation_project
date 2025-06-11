import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';

class CustomAppBarINTracks extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const CustomAppBarINTracks({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: appColor.Primarycolor,
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: appColor.Primarycolor,
          fontFamily: appFonts.Poppins,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
