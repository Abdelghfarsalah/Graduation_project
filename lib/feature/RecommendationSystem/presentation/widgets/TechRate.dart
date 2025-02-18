import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Categories/presentation/widgets/techcard.dart';
import 'package:graduation_project/feature/RecommendationSystem/presentation/widgets/Ratewidget.dart';

class Techrate extends StatelessWidget {
  const Techrate(
      {super.key,
      required this.text,
      required this.width,
      required this.color,
      required this.onTap});
  final String text;
  final double width;
  final Color color;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Techcard(
          color: color,
          text: text,
          width: width,
        ),
        Ratewidget(
          onTap: onTap,
          tech: text,
        )
      ],
    );
  }
}
