import 'package:graduation_project/feature/Courses/domain/models/Section.dart';
import 'package:graduation_project/feature/Courses/domain/models/TrackForonlycources.dart';

class Course {
  final String id;
  final String title;
  final String description;
  final String image;
  final int totalDuration;
  final Trackforonlycources track;
  final List<Section> sections;
  final int v;
  final List<dynamic> topRatings;
  final double averageRating;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.totalDuration,
    required this.track,
    required this.sections,
    required this.v,
    required this.topRatings,
    required this.averageRating,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      totalDuration: json['totalDuration'],
      track: Trackforonlycources.fromJson(json['track']),
      sections:
          (json['sections'] as List).map((e) => Section.fromJson(e)).toList(),
      v: json['__v'],
      topRatings: json['topRatings'] ?? [],
      averageRating: (json['averageRating'] ?? 0).toDouble(),
    );
  }
}
