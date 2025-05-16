import 'package:graduation_project/feature/recommendChat/domain/StepModel.dart';

class RoadmapModel {
  final String? title;
  final String? introduction;
  final List<StepModel>? steps;

  RoadmapModel({
    this.title,
    this.introduction,
    this.steps,
  });

  factory RoadmapModel.fromJson(Map<String, dynamic> json) {
    return RoadmapModel(
      title: json['title'],
      introduction: json['introduction'],
      steps:
          (json['steps'] as List?)?.map((e) => StepModel.fromJson(e)).toList(),
    );
  }
}
