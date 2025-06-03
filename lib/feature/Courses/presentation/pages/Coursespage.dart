import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Courses/data/Api/coursesDataSources.dart';
import 'package:graduation_project/feature/Courses/data/repoimplemts/CoursesrepoImple.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/get_couses_bloc/get_couses_bloc_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/coursespagebody.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCousesBlocBloc(
        Coursesrepoimple(
          coursesdatasources: Coursesdatasources(
            dio: Dio(),
          ),
        ),
      ),
      child: Coursespagebody(),
    );
  }
}
