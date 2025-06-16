import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Courses/domain/repo/coursesrepo.dart';

import 'mark_video_aswatched_event.dart';
import 'mark_video_aswatched_state.dart';

class MarkVideoAswatchedBloc
    extends Bloc<MarkVideoAswatchedEvent, MarkVideoAswatchedState> {
  final Coursesrepo coursesrepo;
  MarkVideoAswatchedBloc(this.coursesrepo)
      : super(initMarkvideoasWatchedSuccess()) {
    on<MarkvideoAsWatched>(_MarkvideoAsWatched);
  }
  bool watched = false;
  void _MarkvideoAsWatched(
      MarkvideoAsWatched event, Emitter<MarkVideoAswatchedState> emit) async {
    var response = await coursesrepo.markvideoAsWatched(
        courseID: event.courseID, videoId: event.videoID);
    response.fold((ifLeft) {}, (ifRight) {
      emit(MarkvideoasWatchedSuccess(id: event.videoID));
    });
  }
}
