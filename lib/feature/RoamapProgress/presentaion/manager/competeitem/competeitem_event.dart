abstract class CompeteitemEvent {}

class MarkItemAsCompleted extends CompeteitemEvent {
  final int stepNumber;
  final String categoryTitle;
  final String itemTitle;

  MarkItemAsCompleted(
      {required this.stepNumber,
      required this.categoryTitle,
      required this.itemTitle});
}
