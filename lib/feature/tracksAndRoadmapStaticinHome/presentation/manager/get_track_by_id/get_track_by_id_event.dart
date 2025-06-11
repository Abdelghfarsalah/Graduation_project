abstract class GetTrackByIDEvent {}

class getTrackByIDEvent extends GetTrackByIDEvent {
  final String id;

  getTrackByIDEvent({required this.id});
}
