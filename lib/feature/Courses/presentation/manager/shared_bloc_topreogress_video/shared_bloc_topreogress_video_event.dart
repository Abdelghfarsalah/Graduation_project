abstract class VideoProgressEvent {}

class VideoThresholdReached extends VideoProgressEvent {
  final String courseId;
  final String videoId;

  VideoThresholdReached({required this.courseId, required this.videoId});
}
