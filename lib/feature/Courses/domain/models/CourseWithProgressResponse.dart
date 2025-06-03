import 'package:graduation_project/feature/Courses/domain/models/CourseDataforonecources.dart';

class CourseWithProgressResponse {
  final bool success;
  final String message;
  final CourseDataforonecources data;

  CourseWithProgressResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CourseWithProgressResponse.fromJson(Map<String, dynamic> json) {
    return CourseWithProgressResponse(
      success: json['success'],
      message: json['message'],
      data: CourseDataforonecources.fromJson(json['data']),
    );
  }
}
