import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Courses/data/Api/coursesDataSources.dart';
import 'package:graduation_project/feature/Courses/data/repoimplemts/CoursesrepoImple.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/get_user_courses/get_user_courses_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/UserCoursesAppBar.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/UsercoursesBody.dart';

class Usercoursespages extends StatelessWidget {
  const Usercoursespages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserCoursesBloc(
        Coursesrepoimple(
          coursesdatasources: Coursesdatasources(
            dio: Dio(),
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: Usercoursesappbar(
          title: "Your Courses",
        ),
        body: Usercoursesbody(),
      ),
    );
  }
}
