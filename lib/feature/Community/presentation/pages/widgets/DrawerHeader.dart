import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/core/utils/communityHelper.dart';
import 'package:graduation_project/feature/home/presentation/Widgets/avatarImage.dart';

class CustomDrawerheader extends StatelessWidget {
  const CustomDrawerheader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // Color(0xFF1C2933),
            Color(0xFF324A5E),
            Color(0xFF0B1014),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // borderRadius: BorderRadius.only(
        //   bottomRight: Radius.circular(30),
        // ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              var image = await SharedPreferencesDemo.getavatar();
              var name = await SharedPreferencesDemo.getUserName();
              Communityhelper.showdialogDisplaycommunityIcon(
                  context, image!, name);
            },
            child: Avatarimage(
              height: 40.h,
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Community",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  fontFamily: appFonts.Poppins,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "Join the discussion",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.sp,
                  fontFamily: appFonts.Poppins,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
