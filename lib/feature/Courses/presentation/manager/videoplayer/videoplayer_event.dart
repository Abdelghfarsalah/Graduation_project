abstract class VideoplayerEvent {}

class playvideo extends VideoplayerEvent {
  final String videoUrl;
  final String id;
  final String videoType;
  final String? youtubeId;

  playvideo(
      {required this.videoUrl,
      required this.id,
      required this.videoType,
      this.youtubeId});
}
