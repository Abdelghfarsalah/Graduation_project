import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utils/animations.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/course_progress/course_progress_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/course_progress/course_progress_event.dart';
import 'package:graduation_project/feature/Courses/presentation/pages/DisplaySpesificCourse.dart';

class Customicontogetcourse extends StatelessWidget {
  const Customicontogetcourse(
      {super.key, required this.id, required this.title});
  final String id;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CourseProgressBloc>().add(GetcourseById(id: id));
        Animationsforpages.navigateWithSlidepush(
            context,
            Displayspesificcourse(
              title: title,
            ));
      },
      child: Icon(Icons.arrow_forward_ios),
    );
  }
}
