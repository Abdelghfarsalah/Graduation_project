import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/techcard.dart';

class Gamedevelopment extends StatelessWidget {
  const Gamedevelopment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "Game Development",
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
        Techcard(
          text: "Docker",
          width: 95,
          color: Color(0xffD8BFD8),
        ),
        Techcard(
          text: "Kubernetes",
          width: 142,
          color: Color(0xffDAAAA7),
        ),
        Techcard(
          text: "Terraform",
          width: 127,
          color: Color(0xffFFC1CC),
        ),
        Techcard(
          text: "AWS CDK",
          width: 103,
          color: Color(0xffA7DAAC),
        ),
      ],
    );
  }
}
