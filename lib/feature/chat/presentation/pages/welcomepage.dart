import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/feature/chat/presentation/widget/welcomepagebody.dart';

class WelcomepageChabot extends StatefulWidget {
  const WelcomepageChabot({super.key});

  @override
  State<WelcomepageChabot> createState() => _WelcomepageChabotState();
}

class _WelcomepageChabotState extends State<WelcomepageChabot> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Container(
            height: 46.h,
            width: 46.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13.r),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xffD3D7D8).withOpacity(0.3),
                      blurRadius: 24.r,
                      spreadRadius: 0,
                      offset: Offset(6.w, 11.h))
                ]),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, size: 18.sp)),
          ),
        ),
      ),
      body: Welcomepagebody(),
    );
  }
}
