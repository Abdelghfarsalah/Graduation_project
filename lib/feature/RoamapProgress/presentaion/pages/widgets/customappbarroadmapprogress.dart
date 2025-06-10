import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/pages/widgets/progressinAppbar.dart';

PreferredSize roadmapAppBarForProgress(
    BuildContext context, String title, double progress) {
  return PreferredSize(
    preferredSize: Size.fromHeight(120.h), // زيادة الارتفاع قليلاً
    child: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r), // زاوية أكبر
          bottomRight: Radius.circular(30.r),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF6A11CB), // لون غامق أنيق
                Color(0xFF2575FC), // لون أزرق جذاب
              ],
              stops: [0.1, 0.9], // تحسين التدرج اللوني
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 15,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.2),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_rounded,
                              color: Colors.white, size: 22.w),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontFamily: appFonts.Poppins,
                          letterSpacing: 0.5,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  // مؤشر التقدم مع تأثيرات حديثة
                  Progressinappbar()
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
