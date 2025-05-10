import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CreateLearningMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.h,
            ),
            Lottie.asset('assets/lottei/Animation - 1746877158429.json',
                width: 200.w, height: 200.h),
            SizedBox(height: 20.h),
            // Text instructions
            Text(
              'Create a new learning map!',
              style: TextStyle(
                fontSize: 24.w,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Start by outlining the topics you want to learn.\n Then, connect them to form \na learning pathway.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.r,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
