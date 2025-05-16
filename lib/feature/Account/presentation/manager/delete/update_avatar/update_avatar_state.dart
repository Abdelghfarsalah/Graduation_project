abstract class UpdateAvatarStatus {}

class UpdateAvatarInitial extends UpdateAvatarStatus {}

class UpdateAvatarLoading extends UpdateAvatarStatus {}

class UpdateAvatarSuccess extends UpdateAvatarStatus {}

class UpdateAvatarFailure extends UpdateAvatarStatus {
  final String error;

  UpdateAvatarFailure(this.error);
}
