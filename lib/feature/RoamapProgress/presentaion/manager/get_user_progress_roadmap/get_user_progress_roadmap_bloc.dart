import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/RoamapProgress/data/api/UserpreogreaaRoadmap.dart';

import 'get_user_progress_roadmap_event.dart';
import 'get_user_progress_roadmap_state.dart';

class GetUserProgressRoadmapBloc
    extends Bloc<GetUserProgressRoadmapEvent, GetUserProgressRoadmapBlocState> {
  final Userpreogreaaroadmap data;
  GetUserProgressRoadmapBloc(this.data) : super(GetUserProgressRoadmapInit()) {
    on<getRoadmap>(_getRoadmap);
  }

  List<double> percentages = [];
  double ProgressRate = 0.0;
  late Map<String, bool> markItemAsComleted;
  void _getRoadmap(
      getRoadmap event, Emitter<GetUserProgressRoadmapBlocState> emit) async {
    emit(GetUserProgressRoadmapLoading());
    try {
      var response = await data.GetUseroadmap();
      response.fold((ifLeft) {
        emit(GetUserProgressRoadmapFailure());
      }, (ifRight) {
        emit(GetUserProgressRoadmapSuccess(ifRight));
      });
    } catch (e) {
      emit(GetUserProgressRoadmapFailure());
    }
  }
}
