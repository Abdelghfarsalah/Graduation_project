import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'save_image_bloc_event.dart';
import 'save_image_bloc_state.dart';

extension SaveImageBlocBlocExt on BuildContext {
  SaveImageBlocBloc get saveImageBlocBloc => read<SaveImageBlocBloc>();
  SaveImageBlocState get saveImageBlocBlocState => saveImageBlocBloc.state;
  
  void addSaveImageBlocEvent(SaveImageBlocEvent event) {
    saveImageBlocBloc.add(event);
  }

  void init() {
    addSaveImageBlocEvent(InitEvent());
  }
}

class SaveImageBlocBloc extends Bloc<SaveImageBlocEvent, SaveImageBlocState> {
  SaveImageBlocBloc() : super(SaveImageBlocState()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<SaveImageBlocState> emit) async {
    emit(state.clone());
  }
}