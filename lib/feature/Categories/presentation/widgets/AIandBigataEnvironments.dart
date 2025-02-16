import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/techcard.dart';

class Aiandbigataenvironments extends StatelessWidget {
  const Aiandbigataenvironments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "AI & Big Data Environments",
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
          text: "Anaconda",
          width: 133,
          color: Color(0xffB7E4C7),
        ),
        Techcard(
          text: "TensorFlow Serving",
          width: 230,
          color: Color(0xffFBC4AB),
        ),
        Techcard(
          text: "Apache Spark",
          width: 165,
          color: Color(0xff89CFF0),
        ),
      ],
    );
  }
}
