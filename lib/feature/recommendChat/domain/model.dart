import 'package:graduation_project/feature/recommendChat/domain/parentclass.dart';

class FlutterRoadmapModel extends Parentclass {
  final String track;
  final String? question;
  final String roadmap;
  final bool fromuser;

  FlutterRoadmapModel({
    required this.track,
    this.question,
    required this.fromuser,
    required this.roadmap,
  });

  factory FlutterRoadmapModel.fromJson(Map<String, dynamic> json) {
    return FlutterRoadmapModel(
      track: json['track'] ?? '',
      question: json['question'] ?? '',
      roadmap: json['roadmap'] ?? '',
      fromuser: null ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'track': track,
      'question': question,
      'roadmap': roadmap,
    };
  }
}
