abstract class UpdateNameEvent {}

class InitEvent extends UpdateNameEvent {}

class UpdateName extends UpdateNameEvent {
  final String name;

  UpdateName({required this.name});
}
