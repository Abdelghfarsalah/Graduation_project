import 'package:flutter/material.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/widget/custom_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPageOnBoarding(
        image: "assets/onboarding/OnboardingIllustration-2.png",
        start: Color(0xffFCECDB),
        ent: Color(0xffFFFFFF),
        title: 'Start your journey',
        subtitle: 'today',
        fourpage: false,
        text:
            "Your journey begins with choosing the right path—follow what inspires you and never stop growing.",
        controller: controller,
      ),
    );
  }
}
