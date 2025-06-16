import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Courses/domain/repo/coursesrepo.dart';

import 'videoplayer_event.dart';
import 'videoplayer_state.dart';

class VideoplayerBloc extends Bloc<VideoplayerEvent, VideoplayerState> {
  final Coursesrepo coursesrepo;
  VideoplayerBloc(this.coursesrepo) : super(InitVideoplayerState()) {
    on<playvideo>(_playvideo);
  }

  void _playvideo(playvideo event, Emitter<VideoplayerState> emit) async {
    print("video pressed: ${event.videoUrl}");
    emit(PlayingVideoloading());
    emit(PlayingVideoState(
      videoUrl: event.videoUrl,
      id: event.id,
      videoType: event.videoType,
      youtubeId: event.youtubeId,
      title: event.title,
      watched: event.watched,
    ));
  }
}
