import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';

PreferredSize roadmapAppBarForProgress(
    BuildContext context, String title, double progress) {
  return PreferredSize(
    preferredSize: Size.fromHeight(120.h),
    child: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1976D2),
                Color(0xFF2196F3),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_rounded,
                            color: Colors.white, size: 24.w),
                        onPressed: () => Navigator.pop(context),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: appFonts.Poppins,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert_rounded,
                            color: Colors.white, size: 24.w),
                        onPressed: () {
                          // Show menu options
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Progress',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                            Text(
                              '${(progress * 100).toStringAsFixed(0)}%',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: LinearProgressIndicator(
                            value: progress,
                            minHeight: 8.h,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
