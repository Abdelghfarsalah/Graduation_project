import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Account/domain/Entities/PersonalInformationmodel.dart';

class Personalinformationcard extends StatelessWidget {
  const Personalinformationcard({super.key, required this.model});
  final Personalinformationmodel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Container(
        height: 43.h,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xffF4F4F4)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.title,
                style: TextStyle(
                    fontFamily: appFonts.Poppins,
                    fontSize: 12.sp,
                    color: appColor.Primarycolor,
                    fontWeight: FontWeight.w500),
              ),
              model.icon
            ],
          ),
        )),
      ),
    );
  }
}
/**ListTile(
            title: ,
            trailing: model.icon,
          ), */
