import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/RoamapProgress/data/model/userRoadmap.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/get_user_progress_roadmap/get_user_progress_roadmap_bloc.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/get_user_progress_roadmap/get_user_progress_roadmap_event.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/get_user_progress_roadmap/get_user_progress_roadmap_state.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/pages/widgets/LearningMapErrorPage.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/pages/widgets/customappbarroadmapprogress.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/pages/widgets/progressBody.dart';

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
        if (state is GetUserProgressRoadmapSuccess) {
          for (int i = 0; i < state.data.data!.stepsProgress!.length; i++) {
            BlocProvider.of<GetUserProgressRoadmapBloc>(context)
                .percentages
                .add(state.data.data!.stepsProgress![i].progressPercent!);
          }
          BlocProvider.of<GetUserProgressRoadmapBloc>(context).ProgressRate =
              state.data.data!.progressPercent!;

          BlocProvider.of<GetUserProgressRoadmapBloc>(context)
              .markItemAsComleted = extractTitleCompletedMap(state.data);

          print(BlocProvider.of<GetUserProgressRoadmapBloc>(context)
              .markItemAsComleted
              .keys
              .length);
        }
      },
      builder: (context, state) {
        if (state is GetUserProgressRoadmapSuccess) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: roadmapAppBarForProgress(
                context,
                state.data.data!.roadmap!.title!,
                double.parse("${state.data.data!.progressPercent!}")),
            body: Progressbody(
              roadmap: state.data,
            ),
          );
        } else {
          return Scaffold(
            appBar: roadmapAppBarForProgress(context, "Roadmap", 0),
            body: LearningMapErrorPage(),
          );
        }
      },
    );
  }
}

Map<String, bool> extractTitleCompletedMap(UserRoadmapProgress userProgress) {
  final Map<String, bool> result = {};
  final steps = userProgress.data?.roadmap?.steps;

  for (var step in steps!) {
    final categories = step.categories;
    if (categories == null) continue;

    for (var category in categories) {
      final items = category.items;
      if (items == null) continue;

      for (var item in items) {
        result[item.title ?? 'Untitled'] = item.completed!;
      }
    }
  }

  return result;
}
