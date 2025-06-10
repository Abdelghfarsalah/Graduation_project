import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// مثلاً: Bloc ثاني
import 'package:graduation_project/feature/RoamapProgress/data/api/UserpreogreaaRoadmap.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/competeitem/competeitem_bloc.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/manager/get_user_progress_roadmap/get_user_progress_roadmap_bloc.dart';
import 'package:graduation_project/feature/RoamapProgress/presentaion/pages/widgets/UserRoabmapProgresspage.dart';

class Progresspage extends StatelessWidget {
  const Progresspage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetUserProgressRoadmapBloc(Userpreogreaaroadmap(dio: Dio())),
        ),
        BlocProvider(
          create: (context) =>
              CompleteItemBloc(Userpreogreaaroadmap(dio: Dio())),
        )
      ],
      child: Userroabmapprogresspage(),
    );
  }
}
