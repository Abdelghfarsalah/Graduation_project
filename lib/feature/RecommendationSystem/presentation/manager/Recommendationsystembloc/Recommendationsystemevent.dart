abstract class RecommendationsystemEvent {}

class recommendEvent extends RecommendationsystemEvent {
  final Map<String, dynamic> data;

  recommendEvent({required this.data});
}
