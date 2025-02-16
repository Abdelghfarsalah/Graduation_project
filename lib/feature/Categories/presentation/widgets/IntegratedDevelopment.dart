import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/techcard.dart';

class Integrateddevelopment extends StatelessWidget {
  const Integrateddevelopment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              "Integrated Development Environments (IDEs) & Code Editors",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: appColor.Primarycolor,
                  fontFamily: appFonts.Poppins,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Web & Mobile Development",
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ),
        Techcard(
          text: "VS Code",
          width: MediaQuery.of(context).size.width * 0.7,
          color: Color(0xffC0DAA7),
        ),
        Techcard(
          text: "Android Studio",
          width: 120,
          color: Color(0xffA7D7DA),
        ),
        Techcard(
          text: "WebStorm",
          width: 120,
          color: Color(0xffDAB9A7),
        ),
        Text(
          "General Software Development",
          style: TextStyle(
              fontFamily: appFonts.Poppins,
              fontWeight: FontWeight.w400,
              fontSize: 14),
        ),
        Techcard(
          text: "NetBeans",
          width: MediaQuery.of(context).size.width * 0.2,
          color: Color(0xffA8A7DA),
        ),
        Techcard(
          text: " IntelliJ IDEA",
          width: 120,
          color: Color(0xffD0A7DA),
        ),
        Techcard(
          text: "Eclipse",
          width: 120,
          color: Color(0xffA7DAAC),
        ),
      ],
    );
  }
}
