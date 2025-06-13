class UserCoursesModel {
  final bool success;
  final String message;
  final CourseData data;

  UserCoursesModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UserCoursesModel.fromJson(Map<String, dynamic> json) {
    return UserCoursesModel(
      success: json['success'],
      message: json['message'],
      data: CourseData.fromJson(json['data']),
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

class CourseData {
  final List<Course> courses;

  CourseData({required this.courses});

  factory CourseData.fromJson(Map<String, dynamic> json) {
    return CourseData(
      courses: List<Course>.from(
        json['courses'].map((course) => Course.fromJson(course)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'courses': courses.map((course) => course.toJson()).toList(),
    };
  }
}

class Course {
  final String id;
  final String title;
  final String description;
  final String image;
  final int totalDuration;
  final double averageRating;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.totalDuration,
    required this.averageRating,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      totalDuration: json['totalDuration'],
      averageRating: (json['averageRating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'image': image,
      'totalDuration': totalDuration,
      'averageRating': averageRating,
    };
  }
}
