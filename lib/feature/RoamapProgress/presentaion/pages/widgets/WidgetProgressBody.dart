import 'package:flutter/material.dart';
import 'package:graduation_project/feature/RoamapProgress/data/model/userRoadmap.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/pages/widgets/DisplaySectionProgress.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/pages/widgets/PercentageDisplay.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/pages/widgets/diplayroadmapinprogress.dart';

class Widgetprogressbody extends StatelessWidget {
  const Widgetprogressbody({super.key, required this.roadmap});
  final UserRoadmapProgress roadmap;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        PercentageDisplay(
          roadmap: roadmap,
        ),
        Displaysectionprogress(
          roadmap: roadmap,
        ),
        SliverList.builder(
            itemCount: roadmap.data!.roadmap!.steps!.length,
            itemBuilder: (context, index) => Diplayroadmapinprogress(
                  mdoel: roadmap,
                  indedx: index,
                  selectedItem:
                      roadmap.data!.roadmap!.steps![index].stepTitle ?? "",
                ))
      ],
    );
  }
}
