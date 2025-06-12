import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Account/domain/repos/repo.dart';
import 'package:graduation_project/feature/Account/presentation/manager/update_avatar/update_avatar_event.dart';

import 'update_avatar_state.dart';

class UpdateAvatarBloc extends Bloc<UpdateAvatarEvent, UpdateAvatarStates> {
  final accountrepo repo;
  UpdateAvatarBloc(this.repo) : super(UpdateAvatarInitial()) {
    on<updateAvatar>(_updateAvatar);
  }

  void _updateAvatar(
      updateAvatar event, Emitter<UpdateAvatarStates> emit) async {
    emit(UpdateAvatarLoading());

    final result = await repo.updateUseravatar(event.imageFile);

    result.fold(
      (failure) => emit(UpdateAvatarFailure("failure")),
      (success) => emit(UpdateAvatarSuccess()),
    );
  }
}
