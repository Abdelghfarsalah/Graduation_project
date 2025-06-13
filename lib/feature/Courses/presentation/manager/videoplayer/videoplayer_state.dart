abstract class VideoplayerState {}

class InitVideoplayerState extends VideoplayerState {}

class PlayingVideoState extends VideoplayerState {
  final String videoUrl;
  final String id;
  final String videoType;
  final String? youtubeId;

  PlayingVideoState(
      {required this.videoUrl,
      required this.id,
      required this.videoType,
      this.youtubeId});
}
