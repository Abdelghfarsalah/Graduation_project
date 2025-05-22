import 'package:graduation_project/feature/Community/data/models/groupsmodel.dart';

abstract class GetGroupState {}

class InitGetGroupState extends GetGroupState {}

class GetGroupLoading extends GetGroupState {}

class GetGroupSuccess extends GetGroupState {
  GroupsResponse groupsResponse;
  GetGroupSuccess({required this.groupsResponse});
}

class GetGroupFailure extends GetGroupState {}

class selectGroupSuccess extends GetGroupState {}
