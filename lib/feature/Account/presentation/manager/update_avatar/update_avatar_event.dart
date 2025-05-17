import 'dart:io';

abstract class UpdateAvatarEvent {}

class InitEvent extends UpdateAvatarEvent {}

class updateAvatar extends UpdateAvatarEvent {
  final File imageFile;

  updateAvatar({required this.imageFile});
}
