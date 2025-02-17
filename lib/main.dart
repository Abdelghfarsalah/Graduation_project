import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:graduation_project/core/Bloc_providers.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/Main_onboarding.dart';

void main() {
  Gemini.init(apiKey: "AIzaSyAB6GPly8gecYvCVDFkRfZ7C6msqtF0Z5s");
  runApp(
    AppBlocProviders.getblocprovider(
      child: const GraduationProject(),
    ),
  );
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
