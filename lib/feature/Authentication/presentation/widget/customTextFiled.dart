import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';

class Customtextfiled extends StatefulWidget {
  const Customtextfiled(
      {super.key,
      required this.hintText,
      required this.labal,
      required this.prefixicon,
      required this.onChanged,
      this.validator,
      required this.focusNode,
      required this.prefixiconfocus,
      this.suffixicon,
      required this.obscureText});
  final String hintText;
  final String labal;
  final Widget prefixicon;
  final Widget? suffixicon;
  final Widget prefixiconfocus;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  final FocusNode focusNode;
  final bool obscureText;

  @override
  State<Customtextfiled> createState() => _CustomtextfiledState();
}

class _CustomtextfiledState extends State<Customtextfiled> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            // BoxShadow(
            //   color: const Color.fromARGB(255, 94, 181, 252), // لون الظل لليمين
            //   spreadRadius: 0,
            //   blurRadius: 10,
            //   offset: Offset(4, 4), // الظل في الاتجاه اليمين
            // ),
          ]),
      child: TextFormField(
        cursorColor: appColor.Primarycolor,
        focusNode: widget.focusNode,
        onChanged: widget.onChanged,
        validator: widget.validator,
        obscureText: widget.obscureText,
        style: TextStyle(
            color: Color(0xff0050D0),
            fontFamily: appFonts.Poppins,
            fontSize: 14,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: widget.suffixicon,
          filled: true,
          hintStyle: TextStyle(
              color: Color(0xffC2C3CB),
              fontSize: 14.sp,
              fontFamily: appFonts.Poppins),
          fillColor: Colors.white,
          prefixIcon: widget.focusNode.hasFocus
              ? widget.prefixiconfocus
              : widget.prefixicon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16), // تعيين نصف القطر
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(16), // نفس نصف القطر عند عدم التركيز
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(16), // نفس نصف القطر عند التركيز
            borderSide: BorderSide(color: appColor.Primarycolor, width: 2.w),
          ),
        ),
      ),
    );
  }
}
