import 'package:graduation_project/feature/Community/data/models/groupsmodel.dart';

abstract class ChangeChatState {}

class InitChangeChatState extends ChangeChatState {}

class ChangeChatLoading extends ChangeChatState {}

class ChangeChatSuccess extends ChangeChatState {
  Group groupsResponse;
  ChangeChatSuccess({required this.groupsResponse});
}

class ChangeChatFailure extends ChangeChatState {}
