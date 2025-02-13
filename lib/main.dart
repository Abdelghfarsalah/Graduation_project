import 'package:flutter/material.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/Main_onboarding.dart';

void main() {
  runApp(const GraduationProject());
}

class GraduationProject extends StatelessWidget {
  const GraduationProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainOnboarding(),
    );
  }
}
