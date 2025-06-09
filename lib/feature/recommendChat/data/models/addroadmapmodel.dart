class AddRoadmapModel {
  final bool success;
  final String message;
  final RoadmapData data;

  AddRoadmapModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AddRoadmapModel.fromJson(Map<String, dynamic> json) {
    return AddRoadmapModel(
      success: json['success'],
      message: json['message'],
      data: RoadmapData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class RoadmapData {
  final String title;
  final String introduction;
  final List<StepModel> steps;

  RoadmapData({
    required this.title,
    required this.introduction,
    required this.steps,
  });

  factory RoadmapData.fromJson(Map<String, dynamic> json) {
    return RoadmapData(
      title: json['title'],
      introduction: json['introduction'],
      steps: (json['steps'] as List)
          .map((step) => StepModel.fromJson(step))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'introduction': introduction,
      'steps': steps.map((e) => e.toJson()).toList(),
    };
  }
}

class StepModel {
  final int stepNumber;
  final String stepTitle;
  final String description;
  final String? link;
  final bool completed;
  final List<CategoryModel> categories;

  StepModel({
    required this.stepNumber,
    required this.stepTitle,
    required this.description,
    required this.link,
    required this.completed,
    required this.categories,
  });

  factory StepModel.fromJson(Map<String, dynamic> json) {
    return StepModel(
      stepNumber: json['step_number'],
      stepTitle: json['step_title'],
      description: json['description'],
      link: json['link'],
      completed: json['completed'],
      categories: (json['categories'] as List)
          .map((cat) => CategoryModel.fromJson(cat))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'step_number': stepNumber,
      'step_title': stepTitle,
      'description': description,
      'link': link,
      'completed': completed,
      'categories': categories.map((e) => e.toJson()).toList(),
    };
  }
}

class CategoryModel {
  final String categoryTitle;
  final List<ItemModel> items;

  CategoryModel({
    required this.categoryTitle,
    required this.items,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryTitle: json['category_title'],
      items: (json['items'] as List)
          .map((item) => ItemModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_title': categoryTitle,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}

class ItemModel {
  final String title;
  final String? link;
  final String duration;
  final String typeOfLink;
  final bool completed;

  ItemModel({
    required this.title,
    this.link,
    required this.duration,
    required this.typeOfLink,
    required this.completed,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      title: json['title'],
      link: json['link'],
      duration: json['duration'],
      typeOfLink: json['type_of_link'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'link': link,
      'duration': duration,
      'type_of_link': typeOfLink,
      'completed': completed,
    };
  }
}
