abstract class StartLearningTracksEvent {}

class Startlearning extends StartLearningTracksEvent {
  final Map<String, dynamic> roadmap;

  Startlearning({required this.roadmap});
}
