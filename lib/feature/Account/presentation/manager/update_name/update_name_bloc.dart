import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Account/domain/repos/repo.dart';
import 'package:graduation_project/feature/Account/presentation/manager/update_name/update_name_state.dart';

import 'update_name_event.dart';

// extension UpdateNameBlocExt on BuildContext {
//   UpdateNameBloc get updateNameBloc => read<UpdateNameBloc>();
//   UpdateNameState get updateNameBlocState => updateNameBloc.state;

//   void addUpdateNameEvent(UpdateNameEvent event) {
//     updateNameBloc.add(event);
//   }

//   void init() {
//     addUpdateNameEvent(InitEvent());
//   }
// }

class UpdateNameBloc extends Bloc<UpdateNameEvent, UpdateNameStatus> {
  final accountrepo repo;
  UpdateNameBloc(this.repo) : super(UpdateNameInitial()) {
    on<UpdateName>(_UpdateName);
  }

  void _UpdateName(UpdateName event, Emitter<UpdateNameStatus> emit) async {
    emit(UpdateNameLoading());

    final result = await repo.updateUserName(event.name);

    result.fold(
      (failure) => emit(UpdateNameFailure("failure")),
      (success) => emit(UpdateNameSuccess()),
    );
  }
}
