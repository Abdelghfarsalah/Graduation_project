import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/enrollment/enrollment_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/enrollment/enrollment_state.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/get_couses_bloc/get_couses_bloc_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/CustomIconTogetCourse.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/Enrollmentbutton.dart';

class Changestateenrollbuttonwhenenrollsuccess extends StatelessWidget {
  const Changestateenrollbuttonwhenenrollsuccess(
      {super.key, required this.id, required this.title, required this.index});
  final String id;
  final String title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EnrollmentBloc, EnrollmentState>(
      listener: (context, state) {
        if (state is EnrollmentSuccess) {
          context.read<GetCousesBlocBloc>().isEnrollments[index] = true;
        }
      },
      builder: (context, state) {
        if (state is EnrollmentSuccess) {
          return Customicontogetcourse(
            id: id,
            title: title,
          );
        } else {
          return EnrollmentButton(
            id: id,
          );
        }
      },
    );
  }
}
