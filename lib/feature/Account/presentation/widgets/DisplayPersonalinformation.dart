import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Account/domain/Entities/PersonalInformationmodel.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/FingerPrintbutton.dart';
import 'package:graduation_project/feature/Account/presentation/widgets/PersonalInformationCard.dart';

class Displaypersonalinformation extends StatefulWidget {
  const Displaypersonalinformation({super.key});

  @override
  State<Displaypersonalinformation> createState() =>
      _DisplaypersonalinformationState();
}

class _DisplaypersonalinformationState
    extends State<Displaypersonalinformation> {
  final List<Personalinformationmodel> PersonalinformationList = [
    Personalinformationmodel(
      title: "Email",
      icon: Text(
        "RahafMohammadIS21@fcai.usc.edu.eg",
        style: TextStyle(
            fontFamily: appFonts.Poppins,
            fontSize: 12.sp,
            color: Color(0xff001A4D),
            fontWeight: FontWeight.w400),
      ),
    ),
    Personalinformationmodel(
      title: "Mobile Phone",
      icon: Text(
        "+201008751062",
        style: TextStyle(
            fontFamily: appFonts.Poppins,
            fontSize: 12.sp,
            color: Color(0xff001A4D),
            fontWeight: FontWeight.w400),
      ),
    ),
    Personalinformationmodel(
      title: "Current Track",
      icon: Text(
        "UI Designer",
        style: TextStyle(
            fontFamily: appFonts.Poppins,
            fontSize: 12.sp,
            color: Color(0xff001A4D),
            fontWeight: FontWeight.w400),
      ),
    ),
    Personalinformationmodel(
      title: "Number of completed Tracks ",
      icon: Text(
        "3",
        style: TextStyle(
            fontFamily: appFonts.Poppins,
            fontSize: 12.sp,
            color: Color(0xff001A4D),
            fontWeight: FontWeight.w400),
      ),
    ),
    Personalinformationmodel(
      title: "Digital badges or awards",
      icon: Text(
        "4",
        style: TextStyle(
            fontFamily: appFonts.Poppins,
            fontSize: 12.sp,
            color: Color(0xff001A4D),
            fontWeight: FontWeight.w400),
      ),
    ),
    Personalinformationmodel(
      title: "Change Pin",
      icon: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.arrow_forward_ios,
            color: appColor.Primarycolor,
          )),
    ),
    Personalinformationmodel(
      title: "Change Password",
      icon: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.arrow_forward_ios,
            color: appColor.Primarycolor,
          )),
    ),
    Personalinformationmodel(title: "Finger Print", icon: Fingerprintbutton()),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: PersonalinformationList.length,
      itemBuilder: (context, index) => Personalinformationcard(
        model: PersonalinformationList[index],
      ),
    );
  }
}
