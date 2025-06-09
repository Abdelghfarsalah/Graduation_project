import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/fonts.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/pages/progressPage.dart';
import 'package:graduation_project/feature/recommendChat/presentation/manager/start_learning_tracks/start_learning_tracks_bloc.dart';
import 'package:graduation_project/feature/recommendChat/presentation/manager/start_learning_tracks/start_learning_tracks_event.dart';
import 'package:graduation_project/feature/recommendChat/presentation/manager/start_learning_tracks/start_learning_tracks_state.dart';

class Startlearnbuttoninagnentmessages extends StatelessWidget {
  const Startlearnbuttoninagnentmessages({
    super.key,
    required this.text,
  });
  final Map<String, dynamic> text;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StartLearningTracksBloc, StartLearningTracksState>(
      listener: (context, state) {
        if (state is SuccessStartLearningTracksState) {
          Animationsforpages.navigateWithSlidepush(
            context,
            Progresspage(),
          );
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is LoadingStartLearningTracksState) {
          return Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
              child: InkWell(
                onTap: () {
                  context
                      .read<StartLearningTracksBloc>()
                      .add(Startlearning(roadmap: text));
                },
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF00C853), // Vibrant green
                        Color(0xFF5EFC82), // Light green
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
              child: InkWell(
                onTap: () {
                  context
                      .read<StartLearningTracksBloc>()
                      .add(Startlearning(roadmap: text));
                },
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF00C853), // Vibrant green
                        Color(0xFF5EFC82), // Light green
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Start Learning',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontFamily: appFonts.Poppins,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
