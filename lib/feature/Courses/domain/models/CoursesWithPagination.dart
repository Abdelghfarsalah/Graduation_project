import 'package:graduation_project/feature/Courses/domain/models/CourseItem.dart';

class CoursesWithPagination {
  final List<CourseItem> items;
  final int totalItems;
  final int totalPages;
  final int currentPage;
  final int perPage;

  CoursesWithPagination({
    required this.items,
    required this.totalItems,
    required this.totalPages,
    required this.currentPage,
    required this.perPage,
  });

  factory CoursesWithPagination.fromJson(Map<String, dynamic> json) {
    return CoursesWithPagination(
      items: List<CourseItem>.from(
        json['items'].map((item) => CourseItem.fromJson(item)),
      ),
      totalItems: json['totalItems'],
      totalPages: json['totalPages'],
      currentPage: json['currentPage'],
      perPage: json['perPage'],
    );
  }
}
