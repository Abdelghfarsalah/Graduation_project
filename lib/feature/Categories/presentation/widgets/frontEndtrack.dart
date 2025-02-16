import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/techcard.dart';

class Frontendtrack extends StatelessWidget {
  const Frontendtrack({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "Web Development",
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
          "FrontEnd",
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ),
        Techcard(
          text: "React.js",
          width: 100,
          color: Color(0xffC0DAA7),
        ),
        Techcard(
          text: "Angular",
          width: 120,
          color: Color(0xffA7D7DA),
        ),
        Techcard(
          text: "Vue.js",
          width: 90,
          color: Color(0xffDAB9A7),
        ),
      ],
    );
  }
}
