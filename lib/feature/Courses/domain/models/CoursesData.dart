import 'package:graduation_project/feature/Courses/domain/models/CoursesWithPagination.dart';

class CoursesData {
  final CoursesWithPagination coursesWithPagination;

  CoursesData({required this.coursesWithPagination});

  factory CoursesData.fromJson(Map<String, dynamic> json) {
    return CoursesData(
      coursesWithPagination:
          CoursesWithPagination.fromJson(json['coursesWithPageination']),
    );
  }
}
