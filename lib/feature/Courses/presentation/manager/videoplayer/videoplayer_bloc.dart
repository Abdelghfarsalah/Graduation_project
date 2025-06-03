import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'videoplayer_event.dart';
import 'videoplayer_state.dart';

extension VideoplayerBlocExt on BuildContext {
  VideoplayerBloc get videoplayerBloc => read<VideoplayerBloc>();
  VideoplayerState get videoplayerBlocState => videoplayerBloc.state;
  
  void addVideoplayerEvent(VideoplayerEvent event) {
    videoplayerBloc.add(event);
  }

  void init() {
    addVideoplayerEvent(InitEvent());
  }
}

class VideoplayerBloc extends Bloc<VideoplayerEvent, VideoplayerState> {
  VideoplayerBloc() : super(VideoplayerState()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<VideoplayerState> emit) async {
    emit(state.clone());
  }
}