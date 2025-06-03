import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Courses/domain/models/CoursesResponse.dart';
import 'package:graduation_project/feature/Courses/presentation/widgets/coursesCard.dart';

class Displayallcourses extends StatelessWidget {
  const Displayallcourses({super.key, required this.coursesResponse});
  final CoursesResponse coursesResponse;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Explore courses or search for what you need',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView.builder(
            itemCount: coursesResponse.data.coursesWithPagination.items.length,
            itemBuilder: (context, index) => CourseCard(
              item: coursesResponse.data.coursesWithPagination.items[index],
              id: coursesResponse.data.coursesWithPagination.items[index].id,
            ),
          ),
        ),
      ],
    );
  }
}
