class SenderModel {
  final String id;
  final String name;
  final String avatar;

  SenderModel({
    required this.id,
    required this.name,
    required this.avatar,
  });

  factory SenderModel.fromJson(Map<String, dynamic> json) {
    return SenderModel(
      id: json['_id'],
      name: json['name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        // 'avatar': avatar,
      };
}
