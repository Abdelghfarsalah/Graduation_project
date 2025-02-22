import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class darweritem extends StatelessWidget {
  const darweritem(
      {super.key, required this.title, this.onTap, required this.icon});
  final String title;
  final void Function()? onTap;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            title: Text(title,
                style: TextStyle(fontSize: 16.sp)), // حجم النص متجاوب
            trailing: SizedBox(
                width: 24.w, height: 24.h, child: icon), // ضبط الأيقونة
          ),
          Divider(
            height: 2.h,
            endIndent: 10.w,
            indent: 10.w,
          ),
        ],
      ),
    );
  }
}
