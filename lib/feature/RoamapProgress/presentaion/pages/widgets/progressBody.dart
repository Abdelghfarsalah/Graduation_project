import 'package:flutter/material.dart';
import 'package:graduation_project/feature/RoamapProgress/data/model/userRoadmap.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/pages/widgets/WidgetProgressBody.dart';

class Progressbody extends StatelessWidget {
  const Progressbody({super.key, required this.roadmap});
  final UserRoadmapProgress roadmap;
  @override
  Widget build(BuildContext context) {
    return Widgetprogressbody(
      roadmap: roadmap,
    );
  }
}
