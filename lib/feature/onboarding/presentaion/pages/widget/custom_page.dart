import 'package:flutter/material.dart';
import 'package:graduation_project/feature/onboarding/presentaion/pages/widget/Custom_Container.dart';

class CustomPageOnBoarding extends StatelessWidget {
  const CustomPageOnBoarding(
      {super.key,
      required this.start,
      required this.ent,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.fourpage,
      required this.text,
      required this.controller});
  final Color start;
  final Color ent;
  final String image;
  final String title;
  final String text;
  final String subtitle;
  final PageController controller;
  final bool fourpage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [start, start, ent])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset(image),
          Spacer(),
          CustomContainer(
            title: title,
            text: text,
            subtitle: subtitle,
            fourpage: fourpage,
            controller: controller,
          )
        ],
      ),
    );
  }
}
