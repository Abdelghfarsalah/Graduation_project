import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/data/models/staticTrackmodels.dart';

abstract class TracksState {}

class TracksInit extends TracksState {}

class TracksLoading extends TracksState {}

class TracksSuccess extends TracksState {
  final TracksResponse data;

  TracksSuccess(this.data);
}

class TracksFailure extends TracksState {}
