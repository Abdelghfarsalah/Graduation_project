import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/get_user_progress_roadmap/get_user_progress_roadmap_bloc.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/get_user_progress_roadmap/get_user_progress_roadmap_event.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/get_user_progress_roadmap/get_user_progress_roadmap_state.dart';

class LearningMapErrorPage extends StatefulWidget {
  const LearningMapErrorPage({super.key});

  @override
  State<LearningMapErrorPage> createState() => _LearningMapErrorPageState();
}

class _LearningMapErrorPageState extends State<LearningMapErrorPage> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.auto_awesome_outlined,
                size: 100, color: Colors.blue.withOpacity(0.8)),
            const SizedBox(height: 32),
            Text(
              'Learning Path Unavailable',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: Colors.grey[900],
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Error uploading your learning map. Maybe it's your problem or you haven't created one yet. Please try again or create one.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 40),
            BlocConsumer<GetUserProgressRoadmapBloc,
                GetUserProgressRoadmapBlocState>(
              listener: (context, state) {
                if (state is GetUserProgressRoadmapFailure && loading) {
                  Fluttertoast.showToast(
                    msg: "Learning Path Unavailable\n Try Again ",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red, // Green color
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
              builder: (context, state) {
                if (state is GetUserProgressRoadmapLoading && loading) {
                  return CircularProgressIndicator(
                    color: Colors.blueAccent,
                  );
                }
                return FilledButton.icon(
                  onPressed: () {
                    loading = true;
                    context
                        .read<GetUserProgressRoadmapBloc>()
                        .add(getRoadmap());
                  },
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text("Try Again"),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            // OutlinedButton.icon(
            //   onPressed: () {
            //     Animationsforpages.navigateWithSlidepush(
            //         context,
            //         Recommendchatpage(
            //           text: '',
            //         ));
            //   },
            //   icon: CircleAvatar(
            //     radius: 19,
            //     backgroundColor: Colors.white,
            //     child: CircleAvatar(
            //       radius: 18,
            //       backgroundColor: appColor.Primarycolor,
            //       child: Center(
            //         child: Image.asset("assets/Icons/logo.png"),
            //       ),
            //     ),
            //   ),
            //   label: const Text("Build New Learning Path"),
            //   style: OutlinedButton.styleFrom(
            //     foregroundColor: Colors.blue[600],
            //     side: BorderSide(color: Colors.blue[600]!),
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 32,
            //       vertical: 16,
            //     ),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 40),
            Text(
              '"The expert in anything was once a beginner"\nYour learning adventure starts with a single step 🚀',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                height: 1.6,
                color: Colors.grey[500],
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
