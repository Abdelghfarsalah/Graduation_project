import 'package:graduation_project/feature/Community/data/models/groupsmodel.dart';

abstract class CommunityChatBlocEvent {}

class getGroups extends CommunityChatBlocEvent {}

class GetSelectGroup extends CommunityChatBlocEvent {
  Group group;
  GetSelectGroup({required this.group});
}
