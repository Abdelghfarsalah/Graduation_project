import 'package:graduation_project/feature/RoamapProgress/data/model/userRoadmap.dart';

abstract class CompleteItemState {}

class CompleteItemInit extends CompleteItemState {}

class CompleteItemLoading extends CompleteItemState {}

class CompleteItemSuccess extends CompleteItemState {
  final UserRoadmapProgress data; // البيانات المُحمّلة بعد إتمام المهمة
  final String title;
  CompleteItemSuccess(this.data, this.title);
}

class CompleteItemFailure extends CompleteItemState {}
