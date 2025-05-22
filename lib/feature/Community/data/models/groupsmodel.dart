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
      createdBy: CreatedBy.fromJson(json['createdBy']),
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
