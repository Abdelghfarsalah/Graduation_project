import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/domain/repo/repoTracks.dart';

import 'get_track_by_id_event.dart';
import 'get_track_by_id_state.dart';

class GetTrackByIDBloc extends Bloc<GetTrackByIDEvent, GetTrackByIDState> {
  final Repotracks repotracks;
  GetTrackByIDBloc(this.repotracks) : super(GetTrackByIDInitial()) {
    on<getTrackByIDEvent>(_GetTrackByID);
  }

  void _GetTrackByID(
      getTrackByIDEvent event, Emitter<GetTrackByIDState> emit) async {
    emit(GetTrackByIDLoading());
    try {
      var response = await repotracks.GetTrackByID(id: event.id);
      response.fold((ifLeft) {
        emit(GetTrackByIDError());
      }, (ifRight) {
        emit(GetTrackByIDSuccess(data: ifRight));
      });
    } catch (e) {
      emit(GetTrackByIDError());
    }
  }
}
