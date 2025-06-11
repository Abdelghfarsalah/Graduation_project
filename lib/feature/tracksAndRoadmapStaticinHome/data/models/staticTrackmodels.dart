class TracksResponse {
  final bool success;
  final String message;
  final List<StaticTracksmodel> items;
  final int totalItems;
  final int totalPages;
  final int currentPage;
  final int perPage;

  TracksResponse({
    required this.success,
    required this.message,
    required this.items,
    required this.totalItems,
    required this.totalPages,
    required this.currentPage,
    required this.perPage,
  });

  static TracksResponse fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return TracksResponse(
      success: json['success'],
      message: json['message'],
      items: (data['items'] as List)
          .map((item) => StaticTracksmodel.fromJson(item))
          .toList(),
      totalItems: data['totalItems'],
      totalPages: data['totalPages'],
      currentPage: data['currentPage'],
      perPage: data['perPage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': {
        'items': items.map((item) => item.toJson()).toList(),
        'totalItems': totalItems,
        'totalPages': totalPages,
        'currentPage': currentPage,
        'perPage': perPage,
      }
    };
  }
}

class StaticTracksmodel {
  final String id;
  final String title;
  final String icon;

  StaticTracksmodel({
    required this.id,
    required this.title,
    required this.icon,
  });

  static StaticTracksmodel fromJson(Map<String, dynamic> json) {
    return StaticTracksmodel(
      id: json['_id'],
      title: json['title'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'icon': icon,
    };
  }
}
