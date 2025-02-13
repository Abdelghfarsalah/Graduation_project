import 'package:flutter/material.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/widget/custom_page.dart';

class PageFour extends StatelessWidget {
  const PageFour({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPageOnBoarding(
        image: "assets/onboarding/Group_11696.png",
        start: Color(0xffEEE8FF),
        ent: Color(0xffFFFFFF),
        controller: controller,
        title: 'Ready to choose ',
        subtitle: 'your future?',
        fourpage: true,
        text:
            "Believe in yourself, embrace the process, and let learning open doors you never imagined. ",
      ),
    );
  }
}
