import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/RoamapProgress/data/model/userRoadmap.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/competeitem/competeitem_bloc.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/competeitem/competeitem_state.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/pages/widgets/PercentBarChart.dart';

class Displaysectionprogress extends StatelessWidget {
  final UserRoadmapProgress roadmap;

  const Displaysectionprogress({
    super.key,
    required this.roadmap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocConsumer<CompleteItemBloc, CompleteItemState>(
        listener: (context, state) {
          print(state);
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Rating
                Text(
                  "Sections Progress",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),

                SizedBox(height: 20),

                PercentBarChart(
                    // percentages: roadmap.data!.stepsProgress!,
                    )
              ],
            ),
          );
        },
      ),
    );
  }
}
