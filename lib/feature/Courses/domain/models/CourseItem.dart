import 'package:graduation_project/feature/Courses/domain/models/Track.dart';

class CourseItem {
  final String id;
  final String title;
  final String image;
  final String description;
  final int totalDuration;
  final String averageRating;
  final Track track;
  final bool isEnrollment;

  CourseItem({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.totalDuration,
    required this.averageRating,
    required this.track,
    required this.isEnrollment,
  });

  factory CourseItem.fromJson(Map<String, dynamic> json) {
    return CourseItem(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      description: json['description'],
      totalDuration: json['totalDuration'],
      averageRating: json['averageRating'],
      track: Track.fromJson(json['track']),
      isEnrollment: json['isEnrollment'],
    );
  }
}
