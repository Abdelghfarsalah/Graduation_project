import 'package:graduation_project/feature/recommendChat/domain/models/StepModel.dart';
import 'package:graduation_project/feature/recommendChat/domain/models/parentclass.dart';

class Roadmapmodel2 extends Parentclass {
  final String? title;
  final String? introduction;
  final List<StepModel>? steps;
  final bool? fromuser;

  Roadmapmodel2({this.title, this.introduction, this.steps, this.fromuser});

  factory Roadmapmodel2.fromJson(Map<String, dynamic> json) {
    return Roadmapmodel2(
      title: json['title'],
      introduction: json['introduction'],
      steps:
          (json['steps'] as List?)?.map((e) => StepModel.fromJson(e)).toList(),
      fromuser: json['fromuser'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'introduction': introduction,
      'steps': steps?.map((e) => e.toJson()).toList(),
      'fromuser': fromuser,
    };
  }
}
