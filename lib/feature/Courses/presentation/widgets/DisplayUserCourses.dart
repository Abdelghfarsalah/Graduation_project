import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors.dart';
import 'package:graduation_project/feature/Courses/domain/models/UserCoursesMode.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/UserCoursesCard.dart';

class Displayusercourses extends StatelessWidget {
  const Displayusercourses(
      {super.key, required this.coursesResponse, required this.title});
  final UserCoursesModel coursesResponse;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: appColor.Primarycolor,
            ),
          ),
        ),
        const SizedBox(height: 25),
        Expanded(
          child: ListView.builder(
            itemCount: coursesResponse.data.courses.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Usercoursescard(
                item: coursesResponse.data.courses[index],
                id: coursesResponse.data.courses[index].id,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
