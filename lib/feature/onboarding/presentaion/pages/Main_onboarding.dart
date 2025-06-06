import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/Page_four.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/first_page.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/second_page.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/third_page.dart';

class MainOnboarding extends StatefulWidget {
  const MainOnboarding({super.key});

  @override
  State<MainOnboarding> createState() => _MainOnboardingState();
}

class _MainOnboardingState extends State<MainOnboarding> {
  final PageController _controller = PageController();
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    setfirsttime();
  }

  Future<void> setfirsttime() async {
    await SharedPreferencesDemo.setFirstTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          // physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [
            FirstPage(
              controller: _controller,
            ),
            SecondPage(
              controller: _controller,
            ),
            ThirdPage(
              controller: _controller,
            ),
            PageFour(
              controller: _controller,
            ),
          ],
        ),
      ]),
    );
  }
}
