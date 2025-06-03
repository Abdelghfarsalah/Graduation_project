import 'package:graduation_project/feature/Courses/domain/models/Videomodel.dart';

class Section {
  final String id;
  final String title;
  final int totalDuration;
  final List<Video> videos;
  final bool allWatched;

  Section({
    required this.id,
    required this.title,
    required this.totalDuration,
    required this.videos,
    required this.allWatched,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      id: json['_id'],
      title: json['title'],
      totalDuration: json['totalDuration'],
      videos: (json['videos'] as List).map((e) => Video.fromJson(e)).toList(),
      allWatched: json['allWatched'],
    );
  }
}
