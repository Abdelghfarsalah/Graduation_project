import 'package:graduation_project/feature/recommendChat/domain/models/CategoryModel.dart';

class StepModel {
  final int? stepNumber;
  final String? stepTitle;
  final String? description;
  final List<CategoryModel>? categories;

  StepModel(
      {this.stepNumber, this.stepTitle, this.description, this.categories});

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

  Map<String, dynamic> toJson() {
    return {
      'step_number': stepNumber,
      'step_title': stepTitle,
      'description': description,
      'categories': categories?.map((e) => e.toJson()).toList(),
    };
  }
}
