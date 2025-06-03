import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/enrollment/enrollment_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/enrollment/enrollment_event.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/enrollment/enrollment_state.dart';
import 'package:shimmer/shimmer.dart';

class EnrollmentButton extends StatelessWidget {
  final String text;
  final String id;
  const EnrollmentButton({
    super.key,
    this.text = "Enroll Now",
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EnrollmentBloc, EnrollmentState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is EnrollmentLoading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 70.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        }
        return GestureDetector(
          onTap: () {
            context.read<EnrollmentBloc>().add(EnrollCourse(id: id));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 05),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
