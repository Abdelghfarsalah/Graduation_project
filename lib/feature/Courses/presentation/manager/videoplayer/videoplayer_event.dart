abstract class VideoplayerEvent {}

class playvideo extends VideoplayerEvent {
  final String url;
  final String id;

  playvideo({required this.url, required this.id});
}
