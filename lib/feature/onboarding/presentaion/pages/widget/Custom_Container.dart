import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/widget/buttons.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/widget/smoothpageIndecator.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/widget/titels.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      required this.title,
      required this.text,
      required this.subtitle,
      required this.controller,
      required this.fourpage});
  final PageController controller;
  final String title;
  final String text;
  final String subtitle;
  final bool fourpage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 320.h,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Titels(title: title, text: text, subtitle: subtitle),
              Spacer(),
              Smoothpageindecator(
                controller: controller,
              ),
              Spacer(),
              Buttons(
                controller: controller,
                Fourpage: fourpage,
              )
            ],
          ),
        ),
      ),
    );
  }
}
