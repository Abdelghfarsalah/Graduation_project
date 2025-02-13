import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/WelcomePage.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key, required this.controller, required this.Fourpage});

  final PageController controller;
  final bool Fourpage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: !Fourpage,
          child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomePage()));
              },
              child: Text("Skip")),
        ),
        GestureDetector(
          onTap: () {
            if (controller.page != 3) {
              controller.nextPage(
                  duration: Duration(microseconds: 50),
                  curve: Curves.bounceInOut);
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomePage()));
            }
          },
          child: Container(
            height: 45,
            width: !Fourpage ? 112 : MediaQuery.sizeOf(context).width * 0.75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: LinearGradient(colors: [
                Color(0xff5FA5FF),
                Color(0xff5FA5FF),
                Color(0xff9CC7FF)
              ]),
            ),
            child: Center(
                child: Text(
              "Next",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: appFonts.Poppins,
                  fontWeight: FontWeight.w600),
            )),
          ),
        )
      ],
    );
  }
}
