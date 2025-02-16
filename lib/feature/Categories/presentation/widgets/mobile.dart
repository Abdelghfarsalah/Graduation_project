import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/techcard.dart';

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "Mobile App Developments",
            style: TextStyle(
                color: appColor.Primarycolor,
                fontFamily: appFonts.Poppins,
                fontWeight: FontWeight.w700,
                fontSize: 20),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Native",
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ),
        Techcard(
          text: "Android (Jetpack, Kolten)",
          width: MediaQuery.of(context).size.width * 0.7,
          color: Color(0xffDAAAA7),
        ),
        Techcard(
          text: " iOS (SwiftUI)",
          width: 120,
          color: Color(0xffA7DAAC),
        ),
        Text(
          "Cross-Platform",
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ),
        Techcard(
          text: "Flutter",
          width: MediaQuery.of(context).size.width * 0.2,
          color: Color(0xffFBC4AB),
        ),
        Techcard(
          text: " React Native",
          width: 120,
          color: Color(0xffFFC1CC),
        ),
      ],
    );
  }
}
