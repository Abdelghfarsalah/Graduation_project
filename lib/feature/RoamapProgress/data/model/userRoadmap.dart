class UserRoadmapprogress {
  final bool? success;
  final String? message;
  final RoadmapData? data;

  UserRoadmapprogress({
    this.success,
    this.message,
    this.data,
  });

  factory UserRoadmapprogress.fromJson(Map<String, dynamic>? json) {
    if (json == null) return UserRoadmapprogress();
    return UserRoadmapprogress(
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
  final String? title;
  final String? introduction;
  final List<RoadmapStep>? steps;
  final int? progressPercent;

  RoadmapData({
    this.title,
    this.introduction,
    this.steps,
    this.progressPercent,
  });

  factory RoadmapData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return RoadmapData();
    return RoadmapData(
      title: json['title'],
      introduction: json['introduction'],
      steps: json['steps'] != null
          ? List<RoadmapStep>.from(
              json['steps'].map((x) => RoadmapStep.fromJson(x)))
          : null,
      progressPercent: json['progressPercent'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'introduction': introduction,
        'steps': steps?.map((x) => x.toJson()).toList(),
        'progressPercent': progressPercent,
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
