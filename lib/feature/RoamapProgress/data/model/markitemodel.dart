// class MarkItemModel {
//   final bool success;
//   final String message;
//   final RoadmapData data;

//   MarkItemModel({
//     required this.success,
//     required this.message,
//     required this.data,
//   });

//   factory MarkItemModel.fromJson(Map<String, dynamic> json) {
//     return MarkItemModel(
//       success: json['success'],
//       message: json['message'],
//       data: RoadmapData.fromJson(json['data']),
//     );
//   }
// }

// class RoadmapData {
//   final Roadmap roadmap;
//   final double progressPercent;
//   final List<StepProgress> stepsProgress;

//   RoadmapData({
//     required this.roadmap,
//     required this.progressPercent,
//     required this.stepsProgress,
//   });

//   factory RoadmapData.fromJson(Map<String, dynamic> json) {
//     return RoadmapData(
//       roadmap: Roadmap.fromJson(json['roadmap']),
//       progressPercent: json['progresspercent']?.toDouble() ?? 0.0,
//       stepsProgress: (json['stepsProgress'] as List)
//           .map((step) => StepProgress.fromJson(step))
//           .toList(),
//     );
//   }
// }

// class Roadmap {
//   final String title;
//   final String introduction;
//   final List<RoadmapStep> steps;

//   Roadmap({
//     required this.title,
//     required this.introduction,
//     required this.steps,
//   });

//   factory Roadmap.fromJson(Map<String, dynamic> json) {
//     return Roadmap(
//       title: json['title'],
//       introduction: json['introduction'],
//       steps: (json['steps'] as List)
//           .map((step) => RoadmapStep.fromJson(step))
//           .toList(),
//     );
//   }
// }

// class RoadmapStep {
//   final int stepNumber;
//   final String stepTitle;
//   final String description;
//   final String? link;
//   final bool completed;
//   final List<Category> categories;

//   RoadmapStep({
//     required this.stepNumber,
//     required this.stepTitle,
//     required this.description,
//     this.link,
//     required this.completed,
//     required this.categories,
//   });

//   factory RoadmapStep.fromJson(Map<String, dynamic> json) {
//     return RoadmapStep(
//       stepNumber: json['step_number'],
//       stepTitle: json['step_title'],
//       description: json['description'],
//       link: json['link'],
//       completed: json['completed'],
//       categories: (json['categories'] as List)
//           .map((cat) => Category.fromJson(cat))
//           .toList(),
//     );
//   }
// }

// class Category {
//   final String categoryTitle;
//   final List<Item> items;

//   Category({
//     required this.categoryTitle,
//     required this.items,
//   });

//   factory Category.fromJson(Map<String, dynamic> json) {
//     return Category(
//       categoryTitle: json['category_title'],
//       items:
//           (json['items'] as List).map((item) => Item.fromJson(item)).toList(),
//     );
//   }
// }

// class Item {
//   final String title;
//   final String link;
//   final String duration;
//   final String typeOfLink;
//   final bool completed;

//   Item({
//     required this.title,
//     required this.link,
//     required this.duration,
//     required this.typeOfLink,
//     required this.completed,
//   });

//   factory Item.fromJson(Map<String, dynamic> json) {
//     return Item(
//       title: json['title'],
//       link: json['link'],
//       duration: json['duration'],
//       typeOfLink: json['type_of_link'],
//       completed: json['completed'],
//     );
//   }
// }

// class StepProgress {
//   final int stepNumber;
//   final double progressPercent;

//   StepProgress({
//     required this.stepNumber,
//     required this.progressPercent,
//   });

//   factory StepProgress.fromJson(Map<String, dynamic> json) {
//     return StepProgress(
//       stepNumber: json['step_number'],
//       progressPercent: json['progressPercent']?.toDouble() ?? 0.0,
//     );
//   }
// }
