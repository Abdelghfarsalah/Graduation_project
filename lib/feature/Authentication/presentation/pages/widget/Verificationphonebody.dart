import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/Back_button.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/Create_your_accout_Text.dart';
import 'package:graduation_project/feature/Authentication/presentation/pages/widget/VerificationphoneActivites.dart';

class Verificationphonebody extends StatelessWidget {
  const Verificationphonebody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          backButton(),
          CreateYourAccoutText(
            title: "Enter Your Phone",
          ),
          Verificationphoneactivites(),
        ],
      ),
    );
  }
}
