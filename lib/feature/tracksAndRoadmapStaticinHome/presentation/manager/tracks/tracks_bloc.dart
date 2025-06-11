import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/tracksAndRoadmapStaticinHome/domain/repo/repoTracks.dart';

import 'tracks_event.dart';
import 'tracks_state.dart';

class TracksBloc extends Bloc<TracksEvent, TracksState> {
  final Repotracks repotracks;
  TracksBloc(this.repotracks) : super(TracksInit()) {
    on<GetAllTracksInHome>(_GetAllTracksInHome);
    on<SearchTracks>(_SearchTracks);
  }

  void _GetAllTracksInHome(
      GetAllTracksInHome event, Emitter<TracksState> emit) async {
    emit(TracksLoading());
    try {
      var response = await repotracks.GetAllTracks();
      response.fold((ifLeft) {
        emit(TracksFailure());
      }, (ifRight) {
        emit(TracksSuccess(ifRight));
      });
    } catch (e) {
      emit(TracksFailure());
    }
  }

  void _SearchTracks(SearchTracks event, Emitter<TracksState> emit) async {
    emit(TracksLoading());
    try {
      var response = await repotracks.SearchTracks(name: event.name);
      response.fold((ifLeft) {
        emit(TracksFailure());
      }, (ifRight) {
        emit(TracksSuccess(ifRight));
      });
    } catch (e) {
      emit(TracksFailure());
    }
  }
}
