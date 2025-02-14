import 'package:flutter/material.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/Back_button.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/ForgetPassActivites.dart';

class Forgetbody extends StatelessWidget {
  const Forgetbody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          backButton(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  "Forget Password",
                  style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: appFonts.Poppins),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, bottom: 30),
            child: Text(
              "Select which contact details should we use to reset your password",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontFamily: appFonts.Poppins),
            ),
          ),
          Forgetpassactivites()
        ],
      ),
    );
  }
}
