abstract class MarkVideoAswatchedEvent {}

class MarkvideoAsWatched extends MarkVideoAswatchedEvent {
  final String courseID;
  final String videoID;

  MarkvideoAsWatched({required this.courseID, required this.videoID});
}
