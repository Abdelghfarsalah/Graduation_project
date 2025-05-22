import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Community/data/models/groupsmodel.dart';

import 'chnage_chat_event.dart';
import 'chnage_chat_state.dart';

class ChnageChatBloc extends Bloc<ChnageChatEvent, ChangeChatState> {
  ChnageChatBloc() : super(InitChangeChatState()) {
    on<ChangeChatEvent>(_ChangeChatEvent);
  }
  // Group currentgroup = Group(
  //   id: '682ef26d6911c149bd4eaedd',
  //   name: "Frontend",
  //   image:
  //       "https://res.cloudinary.com/dwhzpccfb/image/upload/v1747907181/groups/htbev20xnff5b9muqu12.jpg",
  //   createdBy: CreatedBy.fromJson({
  //     "_id": "681f4b66c255db75577f2d7e",
  //     "name": "mohamed shaaban",
  //     "avatar":
  //         "https://res.cloudinary.com/dwhzpccfb/image/upload/v1747170028/users/r7hdf8lx067397nwlpin.jpg"
  //   }),
  // );
  late Group currentgroup;
  void _ChangeChatEvent(
      ChangeChatEvent event, Emitter<ChangeChatState> emit) async {
    emit(ChangeChatLoading());
    currentgroup = event.group;
    emit(ChangeChatSuccess(groupsResponse: currentgroup));
  }
}
