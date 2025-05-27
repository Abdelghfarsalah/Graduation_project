import 'package:graduation_project/feature/Community/domain/modelCommunity/SenderModel.dart';

class MessageModel {
  final String id;
  final SenderModel sender;
  final String? image;
  final String content;
  final String createdAt;
  final String updatedAt;

  MessageModel({
    required this.id,
    required this.sender,
    this.image,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['_id'],
      sender: json['sender'] != null
          ? SenderModel.fromJson(json['sender'])
          : SenderModel(
              id: '',
              name: 'SmartPath User',
              avatar:
                  "https://images.icon-icons.com/1378/PNG/512/avatardefault_92824.png"),
      image: json['image'],
      content: json['content'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'sender': sender.toJson(),
        'image': image,
        'content': content,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
