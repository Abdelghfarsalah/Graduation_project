import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/recommendChat/domain/repo/roadmaprpo.dart';

import 'start_learning_tracks_event.dart';
import 'start_learning_tracks_state.dart';

class StartLearningTracksBloc
    extends Bloc<StartLearningTracksEvent, StartLearningTracksState> {
  final Roadmaprpo roadmaprpo;
  StartLearningTracksBloc(this.roadmaprpo)
      : super(InitStartLearningTracksState()) {
    on<Startlearning>(_Startlearning);
  }

  Future<void> _Startlearning(
      Startlearning event, Emitter<StartLearningTracksState> emit) async {
    emit(LoadingStartLearningTracksState());
    try {
      var reposnse = await roadmaprpo.AddRoadmapForLearning(event.roadmap);
      reposnse.fold((ifLeft) {
        emit(FailureStartLearningTracksState());
      }, (ifRight) {
        emit(SuccessStartLearningTracksState());
      });
    } catch (e) {
      emit(FailureStartLearningTracksState());
    }
  }
}
