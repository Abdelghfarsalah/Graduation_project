import 'package:graduation_project/feature/recommendChat/domain/CategoryModel.dart';

class StepModel {
  final int? stepNumber;
  final String? stepTitle;
  final String? description;
  final List<CategoryModel>? categories;

  StepModel({
    this.stepNumber,
    this.stepTitle,
    this.description,
    this.categories,
  });

  factory StepModel.fromJson(Map<String, dynamic> json) {
    return StepModel(
      stepNumber: json['step_number'],
      stepTitle: json['step_title'],
      description: json['description'],
      categories: (json['categories'] as List?)
          ?.map((e) => CategoryModel.fromJson(e))
          .toList(),
    );
  }
}
