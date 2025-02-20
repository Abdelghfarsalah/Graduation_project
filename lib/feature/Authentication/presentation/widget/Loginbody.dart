import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Back_button.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Create_your_accout_Text.dart';
import 'package:graduation_project/feature/Authentication/presentation/widget/Loginactivities.dart';

class Loginbody extends StatelessWidget {
  const Loginbody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          backButton(),
          CreateYourAccoutText(
            title: "Login Your Account",
          ),
          Loginactivities(),
        ],
      ),
    );
  }
}
