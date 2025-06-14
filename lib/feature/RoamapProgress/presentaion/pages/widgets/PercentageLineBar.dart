import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/competeitem/competeitem_bloc.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/competeitem/competeitem_state.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/get_user_progress_roadmap/get_user_progress_roadmap_bloc.dart';

class PercentageLineBar extends StatefulWidget {
  final int index;
  PercentageLineBar({super.key, required this.index});

  @override
  State<PercentageLineBar> createState() => _PercentageLineBarState();
}

class _PercentageLineBarState extends State<PercentageLineBar> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteItemBloc, CompleteItemState>(
      listener: (context, state) {
        if (state is CompleteItemSuccess) {
          setState(() {
            BlocProvider.of<GetUserProgressRoadmapBloc>(context)
                    .percentages[widget.index] =
                state.data.data!.stepsProgress![widget.index].progressPercent!;
          });
          // print("=========================");
          // print("${widget.percent}");
          // setState(() {
          //   widget.percent =
          //       state.data.data!.stepsProgress![widget.index].progressPercent!;
          // });
        }
      },
      builder: (context, state) {
        // if (state is CompleteItemLoading) {
        //   return SizedBox(
        //     width: 100.w,
        //     child: LinearProgressIndicator(
        //       color: Colors.greenAccent,
        //     ),
        //   );
        // } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: BlocProvider.of<GetUserProgressRoadmapBloc>(context)
                          .percentages[widget.index] /
                      100,
                  minHeight: 12,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "${(BlocProvider.of<GetUserProgressRoadmapBloc>(context).percentages[widget.index]).toStringAsFixed(2)}%",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        );
        // }
      },
    );
  }
}
