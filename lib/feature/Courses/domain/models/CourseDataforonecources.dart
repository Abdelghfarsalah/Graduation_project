import 'package:graduation_project/feature/Courses/domain/models/Course.dart';

class CourseDataforonecources {
  final Course course;

  CourseDataforonecources({required this.course});

  factory CourseDataforonecources.fromJson(Map<String, dynamic> json) {
    return CourseDataforonecources(
      course: Course.fromJson(json['course']),
    );
  }
}
