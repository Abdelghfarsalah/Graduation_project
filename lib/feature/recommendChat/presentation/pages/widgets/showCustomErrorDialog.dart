import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/feature/recommendChat/presentation/manager/reccomend_chat_bloc_bloc.dart';
import 'package:graduation_project/feature/recommendChat/presentation/manager/reccomend_chat_bloc_event.dart';

void showTechTrackErrorDialog(BuildContext context, String messageData) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.grey[900], // Dark background
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.blueAccent.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
          side: BorderSide(color: Colors.blueAccent, width: 1.5.w),
        ),
        title: Row(
          children: [
            Icon(Icons.warning_rounded, color: Colors.orangeAccent, size: 24.w),
            SizedBox(width: 12.w),
            Text(
              "Track Selection Error",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "We encountered an issue:",
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 15.sp,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  "${messageData} is not a recognized Computer Science track.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Please select a valid tech track:",
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 12.h),
              Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: [
                  _buildTechChip("Web Development", context),
                  _buildTechChip("Machine Learning", context),
                  _buildTechChip("Data Science", context),
                  _buildTechChip("Mobile Development", context),
                  _buildTechChip("Cybersecurity", context),
                  _buildTechChip("Cloud Computing", context),
                  _buildTechChip("Game Development", context),
                  _buildTechChip("Software Engineering", context),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: Colors.blueAccent,
            ),
            child: Text(
              "Dismiss",
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.blue[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              "Try Again",
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
          ),
        ],
        actionsAlignment: MainAxisAlignment.spaceBetween,
      );
    },
  );
}

Widget _buildTechChip(String track, BuildContext context) {
  return ActionChip(
    label: Text(track, style: TextStyle(color: Colors.white, fontSize: 13.sp)),
    backgroundColor: Colors.blue[900],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    onPressed: () {
      if (context.read<ReccomendChatBlocBloc>().track.length != 0 &&
          context.read<ReccomendChatBlocBloc>().roadmap.title!.length != 0) {
        context
            .read<ReccomendChatBlocBloc>()
            .add(FetchroadmapwithQuestion(Question: track));
      } else {
        context.read<ReccomendChatBlocBloc>().add(Fetchroadmap(track));
      }
      Navigator.pop(context);
      // _showTrackConfirmation(context, track);
    },
  );
}

void _showTrackConfirmation(BuildContext context, String track) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        "Selected track: $track",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
      ),
      backgroundColor: Colors.green[700],
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      margin: EdgeInsets.all(16.w),
      duration: Duration(seconds: 3),
    ),
  );
}
