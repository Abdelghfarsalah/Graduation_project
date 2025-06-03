abstract class VideoplayerState {}

class InitVideoplayerState extends VideoplayerState {}

class PlayingVideoState extends VideoplayerState {
  final String videoUrl;
  final String id;

  PlayingVideoState({required this.videoUrl, required this.id});
}
