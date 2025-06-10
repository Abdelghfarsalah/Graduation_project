import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/competeitem/competeitem_bloc.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/competeitem/competeitem_state.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/get_user_progress_roadmap/get_user_progress_roadmap_bloc.dart';

class Progressinappbar extends StatefulWidget {
  const Progressinappbar({super.key});

  @override
  State<Progressinappbar> createState() => _ProgressinappbarState();
}

class _ProgressinappbarState extends State<Progressinappbar> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteItemBloc, CompleteItemState>(
      listener: (context, state) {
        if (state is CompleteItemSuccess) {
          print("=======================================");
          setState(() {
            BlocProvider.of<GetUserProgressRoadmapBloc>(context).ProgressRate =
                state.data.data!.progressPercent!;
          });
        }
      },
      builder: (context, state) {
        if (state is CompleteItemSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Text(
                  '${BlocProvider.of<GetUserProgressRoadmapBloc>(context).ProgressRate}% complete',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              Container(
                height: 6.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white.withOpacity(0.2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: state.data.data!.progressPercent! / 100,
                  ),
                ),
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: Text(
                  '${BlocProvider.of<GetUserProgressRoadmapBloc>(context).ProgressRate}% complete',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              Container(
                height: 6.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white.withOpacity(0.2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    color: Colors.greenAccent,
                    backgroundColor: Colors.grey.shade300,
                    value: BlocProvider.of<GetUserProgressRoadmapBloc>(context)
                            .ProgressRate /
                        100,
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
