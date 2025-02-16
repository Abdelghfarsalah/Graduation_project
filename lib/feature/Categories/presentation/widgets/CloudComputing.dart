import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/techcard.dart';

class Cloudcomputing extends StatelessWidget {
  const Cloudcomputing({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "Cloud Computing ",
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
          "Cloud Services",
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ),
        Techcard(
          text: "AWS",
          width: 70,
          color: Color(0xffA0E7E5),
        ),
        Techcard(
          text: " Google Cloud",
          width: 170,
          color: Color(0xffFFC1CC),
        ),
        Techcard(
          text: " Microsoft Azure",
          width: 180,
          color: Color(0xff95B2DE),
        ),
        Text(
          "Container Management",
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ),
        Techcard(
          text: "Docker",
          width: 120,
          color: Color(0xffEBE07C),
        ),
        Techcard(
          text: "Kubernetes",
          width: 150,
          color: Color(0xffDAA7C2),
        ),
      ],
    );
  }
}
