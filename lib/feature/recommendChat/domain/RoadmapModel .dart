import 'package:graduation_project/feature/recommendChat/domain/StepModel.dart';
import 'package:graduation_project/feature/recommendChat/domain/parentclass.dart';

class Roadmapmodel extends Parentclass {
  final String? title;
  final String? introduction;
  final List<StepModel>? steps;
  final bool? fromuser;

  Roadmapmodel({this.title, this.introduction, this.steps, this.fromuser});

  factory Roadmapmodel.fromJson(Map<String, dynamic> json) {
    return Roadmapmodel(
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
