import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'save_image_bloc_event.dart';
import 'save_image_bloc_state.dart';

// extension SaveImageBlocBlocExt on BuildContext {
//   SaveImageBlocBloc get saveImageBlocBloc => read<SaveImageBlocBloc>();
//   SaveImageBlocState get saveImageBlocBlocState => saveImageBlocBloc.state;

//   void addSaveImageBlocEvent(SaveImageBlocEvent event) {
//     saveImageBlocBloc.add(event);
//   }

//   void init() {
//     addSaveImageBlocEvent(InitEvent());
//   }
// }

class SaveImageBlocBloc extends Bloc<SaveImageBlocEvent, DownloadImageState> {
  SaveImageBlocBloc() : super(InitDownloadState()) {
    on<SaveImage>(_SaveImage);
  }

  void _SaveImage(SaveImage event, Emitter<DownloadImageState> emit) async {}
}
