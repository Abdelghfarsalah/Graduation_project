abstract class TracksEvent {}

class GetAllTracksInHome extends TracksEvent {}

class SearchTracks extends TracksEvent {
  final String name;

  SearchTracks({required this.name});
}
