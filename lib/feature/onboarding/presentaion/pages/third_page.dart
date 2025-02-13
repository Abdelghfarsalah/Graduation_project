import 'package:flutter/material.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/widget/custom_page.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPageOnBoarding(
        image: "assets/onboarding/OnboardingIllustration-3.png",
        controller: controller,
        start: Color(0xffE5FFD8),
        ent: Color(0xffFFFFFF),
        title: 'Shall we help you ',
        subtitle: 'graduate?',
        fourpage: false,
        text:
            "Your journey begins with choosing the right path—follow what inspires you and never stop growing.",
      ),
    );
  }
}
