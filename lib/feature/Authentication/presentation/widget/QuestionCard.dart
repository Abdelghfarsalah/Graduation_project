import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/colors.dart';

class Questioncard extends StatelessWidget {
  const Questioncard({
    super.key,
    required this.q,
    required this.hint,
    required this.onChanged,
    required this.validator,
    this.keyboardType,
  });

  final String q;
  final String hint;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // محاذاة النص إلى اليسار
      children: [
        Text(q, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
        TextFormField(
          cursorColor: appColor.Primarycolor,
          keyboardType: keyboardType,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                color: Color(0xffC4C4C4),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600),
            border: InputBorder.none, // حذف الحدود
            enabledBorder: InputBorder.none, // حذف الحدود عند عدم التركيز
            focusedBorder: InputBorder.none, // حذف الحدود عند التركيز
          ),
        ),
      ],
    );
  }
}
