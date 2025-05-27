class GroupsResponse {
  final bool success;
  final String message;
  final GroupsData data;

  GroupsResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GroupsResponse.fromJson(Map<String, dynamic> json) {
    return GroupsResponse(
      success: json['success'],
      message: json['message'],
      data: GroupsData.fromJson(json['data']),
    );
  }
}

class GroupsData {
  final List<Group> groups;

  GroupsData({required this.groups});

  factory GroupsData.fromJson(Map<String, dynamic> json) {
    return GroupsData(
      groups: List<Group>.from(json['groups'].map((x) => Group.fromJson(x))),
    );
  }
}

class Group {
  final String id;
  final String name;
  final String image;
  final CreatedBy createdBy;

  Group({
    required this.id,
    required this.name,
    required this.image,
    required this.createdBy,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['_id'],
      name: json['name'],
      createdBy: json['createdBy'] != null
          ? CreatedBy.fromJson(json['createdBy'])
          : CreatedBy(
              id: '',
              name: 'SmartPath User',
              avatar:
                  "data:image/jpeg;base64,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"),
      image: json['image'],
    );
  }
}

class CreatedBy {
  final String id;
  final String name;
  final String avatar;

  CreatedBy({
    required this.id,
    required this.name,
    required this.avatar,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return CreatedBy(
      id: json['_id'],
      name: json['name'],
      avatar: json['avatar'],
    );
  }
}
