import 'package:graduation_project/feature/Community/data/models/groupsmodel.dart';

abstract class ChnageChatEvent {}

class ChangeChatEvent extends ChnageChatEvent {
  Group group;
  ChangeChatEvent({required this.group});
}
