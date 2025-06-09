import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/get_user_progress_roadmap/get_user_progress_roadmap_bloc.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/get_user_progress_roadmap/get_user_progress_roadmap_event.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/get_user_progress_roadmap/get_user_progress_roadmap_state.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/pages/widgets/customappbarroadmapprogress.dart';

class Userroabmapprogresspage extends StatefulWidget {
  const Userroabmapprogresspage({super.key});

  @override
  State<Userroabmapprogresspage> createState() =>
      _UserroabmapprogresspageState();
}

class _UserroabmapprogresspageState extends State<Userroabmapprogresspage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetUserProgressRoadmapBloc>().add(getRoadmap());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserProgressRoadmapBloc,
        GetUserProgressRoadmapBlocState>(
      listener: (context, state) {
        print(state);
      },
      builder: (context, state) {
        if (state is GetUserProgressRoadmapSuccess) {
          return Scaffold(
            appBar: roadmapAppBarForProgress(context, state.data.data!.title!,
                double.parse("${state.data.data!.progressPercent!}")),
          );
        } else {
          return Scaffold(
            appBar: roadmapAppBarForProgress(context, "Roadmap", 0),
          );
        }
      },
    );
  }
}
