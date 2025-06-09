import 'package:graduation_project/feature/RoamapProgress/data/model/userRoadmap.dart';

abstract class GetUserProgressRoadmapBlocState {}

class GetUserProgressRoadmapInit extends GetUserProgressRoadmapBlocState {}

class GetUserProgressRoadmapLoading extends GetUserProgressRoadmapBlocState {}

class GetUserProgressRoadmapSuccess extends GetUserProgressRoadmapBlocState {
  final UserRoadmapprogress data; // لو عايز تحمل الداتا مع النجاح

  GetUserProgressRoadmapSuccess(this.data);
}

class GetUserProgressRoadmapFailure extends GetUserProgressRoadmapBlocState {}
