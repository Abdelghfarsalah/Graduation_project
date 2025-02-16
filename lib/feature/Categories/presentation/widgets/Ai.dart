import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/techcard.dart';

class AlAndMachineLearning extends StatelessWidget {
  const AlAndMachineLearning({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Artificial Intelligence & Machine Learning",
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
              text: "TensorFlow",
              width: 150,
              color: Color(0xff95B2DE),
            ),
            Techcard(
              text: " PyTorch",
              width: 120,
              color: Color(0xffEBE07C),
            ),
            Techcard(
              text: "Scikit-learn",
              width: 150,
              color: Color(0xffDAA7C2),
            ),
            Techcard(
              text: "Keras",
              width: 120,
              color: Color(0xffA0E7E5),
            ),
          ],
        )
      ],
    );
  }
}
