abstract class UpdateAvatarStates {}

class UpdateAvatarInitial extends UpdateAvatarStates {}

class UpdateAvatarLoading extends UpdateAvatarStates {}

class UpdateAvatarSuccess extends UpdateAvatarStates {}

class UpdateAvatarFailure extends UpdateAvatarStates {
  final String error;

  UpdateAvatarFailure(this.error);
}
