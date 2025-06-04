import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';

class CustomAppBarInitiative extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final String image;
  const CustomAppBarInitiative({
    super.key,
    required this.title,
    this.showBackButton = true,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
            fontFamily: appFonts.Poppins),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  image,
                  width: 38, // أقل من أو يساوي القطر
                  height: 38,
                  fit: BoxFit.contain, // علشان تملى الدائرة كاملة بدون فراغ
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
