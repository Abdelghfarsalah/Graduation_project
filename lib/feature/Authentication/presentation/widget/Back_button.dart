import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class backButton extends StatelessWidget {
  const backButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 46.h,
          width: 46.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: FittedBox(
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.blue,
                size: 15.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
