abstract class VideoProgressState {}

class VideoProgressInitial extends VideoProgressState {}

class VideoProgressReachedState extends VideoProgressState {
  final String courseId;
  final String videoId;

  VideoProgressReachedState({required this.courseId, required this.videoId});
}
