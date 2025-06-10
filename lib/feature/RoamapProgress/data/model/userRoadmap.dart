class UserRoadmapProgress {
  final bool? success;
  final String? message;
  final RoadmapData? data;

  UserRoadmapProgress({
    this.success,
    this.message,
    this.data,
  });

  factory UserRoadmapProgress.fromJson(Map<String, dynamic>? json) {
    if (json == null) return UserRoadmapProgress();
    return UserRoadmapProgress(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? RoadmapData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };
}

class RoadmapData {
  final Roadmap? roadmap;
  final double? progressPercent;
  final List<StepProgress>? stepsProgress;

  RoadmapData({
    this.roadmap,
    this.progressPercent,
    this.stepsProgress,
  });

  factory RoadmapData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RoadmapData();
    return RoadmapData(
      roadmap:
          json['roadmap'] != null ? Roadmap.fromJson(json['roadmap']) : null,
      progressPercent: json['progresspercent']?.toDouble(),
      stepsProgress: json['stepsProgress'] != null
          ? List<StepProgress>.from(
              json['stepsProgress'].map((x) => StepProgress.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'roadmap': roadmap?.toJson(),
        'progresspercent': progressPercent,
        'stepsProgress': stepsProgress?.map((x) => x.toJson()).toList(),
      };
}

class Roadmap {
  final String? title;
  final String? introduction;
  final List<RoadmapStep>? steps;

  Roadmap({
    this.title,
    this.introduction,
    this.steps,
  });

  factory Roadmap.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Roadmap();
    return Roadmap(
      title: json['title'],
      introduction: json['introduction'],
      steps: json['steps'] != null
          ? List<RoadmapStep>.from(
              json['steps'].map((x) => RoadmapStep.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'introduction': introduction,
        'steps': steps?.map((x) => x.toJson()).toList(),
      };
}

class RoadmapStep {
  final int? stepNumber;
  final String? stepTitle;
  final String? description;
  final String? link;
  final bool? completed;
  final List<Category>? categories;

  RoadmapStep({
    this.stepNumber,
    this.stepTitle,
    this.description,
    this.link,
    this.completed,
    this.categories,
  });

  factory RoadmapStep.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RoadmapStep();
    return RoadmapStep(
      stepNumber: json['step_number'],
      stepTitle: json['step_title'],
      description: json['description'],
      link: json['link'],
      completed: json['completed'],
      categories: json['categories'] != null
          ? List<Category>.from(
              json['categories'].map((x) => Category.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'step_number': stepNumber,
        'step_title': stepTitle,
        'description': description,
        'link': link,
        'completed': completed,
        'categories': categories?.map((x) => x.toJson()).toList(),
      };
}

class Category {
  final String? categoryTitle;
  final List<CategoryItem>? items;

  Category({
    this.categoryTitle,
    this.items,
  });

  factory Category.fromJson(Map<String, dynamic>? json) {
    if (json == null) return Category();
    return Category(
      categoryTitle: json['category_title'],
      items: json['items'] != null
          ? List<CategoryItem>.from(
              json['items'].map((x) => CategoryItem.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'category_title': categoryTitle,
        'items': items?.map((x) => x.toJson()).toList(),
      };
}

class CategoryItem {
  final String? title;
  final String? link;
  final String? duration;
  final String? typeOfLink;
  final bool? completed;

  CategoryItem({
    this.title,
    this.link,
    this.duration,
    this.typeOfLink,
    this.completed,
  });

  factory CategoryItem.fromJson(Map<String, dynamic>? json) {
    if (json == null) return CategoryItem();
    return CategoryItem(
      title: json['title'],
      link: json['link'],
      duration: json['duration'],
      typeOfLink: json['type_of_link'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'link': link,
        'duration': duration,
        'type_of_link': typeOfLink,
        'completed': completed,
      };
}

class StepProgress {
  final int? stepNumber;
  final double? progressPercent;

  StepProgress({
    this.stepNumber,
    this.progressPercent,
  });

  factory StepProgress.fromJson(Map<String, dynamic>? json) {
    if (json == null) return StepProgress();
    return StepProgress(
      stepNumber: json['step_number'],
      progressPercent: json['progressPercent']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'step_number': stepNumber,
        'progressPercent': progressPercent,
      };
}
