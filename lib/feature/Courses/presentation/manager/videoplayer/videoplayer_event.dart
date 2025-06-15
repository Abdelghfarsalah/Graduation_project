import 'package:equatable/equatable.dart';

abstract class VideoplayerEvent {}

class playvideo extends VideoplayerEvent with EquatableMixin {
  final String videoUrl;
  final String id;
  final String videoType;
  final String title;
  final String? youtubeId;

  playvideo({
    required this.videoUrl,
    required this.id,
    required this.title,
    required this.videoType,
    this.youtubeId,
  });

  @override
  List<Object?> get props => [videoUrl, id, videoType, youtubeId];
}
