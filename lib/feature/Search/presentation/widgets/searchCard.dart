import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Search/domain/Entities/SearchModel.dart';

class Searchcard extends StatelessWidget {
  const Searchcard({super.key, required this.model});
  final Searchmodel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 12.r,
                spreadRadius: 0,
                color: Color(0xffB8B8D2).withOpacity(0.2))
          ]),
      child: Column(
        children: [
          Image.asset(
            model.image,
            height: 100.h,
          ),
          Text(
            model.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: appColor.Primarycolor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: appFonts.Poppins),
          )
        ],
      ),
    );
  }
}
