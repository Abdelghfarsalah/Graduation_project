import 'package:flutter/material.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/widget/custom_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPageOnBoarding(
        image: "assets/onboarding/OnboardingIllustration 1.png",
        start: Color(0xffDEE9FF),
        ent: Color(0xffFFFFFF),
        title: 'We guide you ',
        subtitle: 'smartly',
        fourpage: false,
        text:
            "Education is the foundation that builds your future; every step you take in learning brings you closer to your dreams.",
        controller: controller,
      ),
    );
  }
}
