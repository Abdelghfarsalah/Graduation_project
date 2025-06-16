abstract class MarkVideoAswatchedState {}

class initMarkvideoasWatchedSuccess extends MarkVideoAswatchedState {}

class MarkvideoasWatchedSuccess extends MarkVideoAswatchedState {
  final String id;

  MarkvideoasWatchedSuccess({required this.id});
}
