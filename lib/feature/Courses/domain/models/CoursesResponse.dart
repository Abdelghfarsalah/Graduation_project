import 'package:graduation_project/feature/Courses/domain/models/CoursesData.dart';

class CoursesResponse {
  final bool success;
  final String message;
  final CoursesData data;

  CoursesResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CoursesResponse.fromJson(Map<String, dynamic> json) {
    return CoursesResponse(
      success: json['success'],
      message: json['message'],
      data: CoursesData.fromJson(json['data']),
    );
  }
}
