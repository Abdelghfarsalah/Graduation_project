import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/RoamapProgress/data/model/userRoadmap.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/competeitem/competeitem_bloc.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/competeitem/competeitem_state.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/get_user_progress_roadmap/get_user_progress_roadmap_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentageDisplay extends StatefulWidget {
  final UserRoadmapProgress roadmap;

  const PercentageDisplay({
    super.key,
    required this.roadmap,
  });

  @override
  State<PercentageDisplay> createState() => _PercentageDisplayState();
}

class _PercentageDisplayState extends State<PercentageDisplay> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocConsumer<CompleteItemBloc, CompleteItemState>(
        listener: (context, state) {
          if (state is CompleteItemSuccess) {
            setState(() {
              BlocProvider.of<GetUserProgressRoadmapBloc>(context)
                  .ProgressRate = state.data.data!.progressPercent!;
            });
            print(BlocProvider.of<GetUserProgressRoadmapBloc>(context)
                .ProgressRate);
            // print("=========================");
            // print("${widget.percent}");
            // setState(() {
            //   widget.percent =
            //       state.data.data!.stepsProgress![widget.index].progressPercent!;
            // });
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your Progress",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    Chip(
                      backgroundColor: Colors.amber.withOpacity(0.2),
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 18),
                          SizedBox(width: 4),
                          Text(
                            "${(BlocProvider.of<GetUserProgressRoadmapBloc>(context).ProgressRate / 100 * 5).toStringAsFixed(2)}/5",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                // Main Content
                Row(
                  children: [
                    CircularPercentIndicator(
                      radius: 80.0,
                      lineWidth: 12.0,
                      percent:
                          BlocProvider.of<GetUserProgressRoadmapBloc>(context)
                                  .ProgressRate /
                              100,
                      center: Text(
                        "${(BlocProvider.of<GetUserProgressRoadmapBloc>(context).ProgressRate)}%",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      progressColor: Colors.greenAccent,
                      backgroundColor: Colors.grey.shade300,
                      circularStrokeCap: CircularStrokeCap.round,
                      animation: true,
                      animationDuration: 1200,
                    ),

                    SizedBox(width: 20),

                    // Legend
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLegendItem(
                            color: Colors.greenAccent,
                            text: "Completed Curriculum",
                            value:
                                "${(BlocProvider.of<GetUserProgressRoadmapBloc>(context).ProgressRate).toStringAsFixed(1)}%",
                          ),
                          SizedBox(height: 12),
                          _buildLegendItem(
                            color: Colors.grey.shade300,
                            text: "Remaining to Complete",
                            value:
                                "${(100 - (BlocProvider.of<GetUserProgressRoadmapBloc>(context).ProgressRate)).toStringAsFixed(1)}%",
                          ),
                          SizedBox(height: 15),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "You're progressing faster than ${(BlocProvider.of<GetUserProgressRoadmapBloc>(context).ProgressRate).toStringAsFixed(1)}% of students!",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLegendItem({
    required Color color,
    required String text,
    required String value,
  }) {
    return Row(
      children: [
        // المربع الملون
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8),

        // النص
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 14),
          ),
        ),

        // القيمة
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
