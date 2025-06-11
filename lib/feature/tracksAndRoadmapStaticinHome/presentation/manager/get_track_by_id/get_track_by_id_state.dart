import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/data/models/SingelTrackMode.dart';

abstract class GetTrackByIDState {}

class GetTrackByIDInitial extends GetTrackByIDState {}

class GetTrackByIDLoading extends GetTrackByIDState {}

class GetTrackByIDSuccess extends GetTrackByIDState {
  final SingleTrackModel data;

  GetTrackByIDSuccess({required this.data});
}

class GetTrackByIDError extends GetTrackByIDState {}
