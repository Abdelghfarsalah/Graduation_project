import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Community/data/communityDataSourses.dart';
import 'package:graduation_project/feature/Community/presentation/manager/community_chat_bloc/community_chat_bloc_state.dart';

import 'community_chat_bloc_event.dart';
// import 'community_chat_bloc_state.dart';

// extension CommunityChatBlocBlocExt on BuildContext {
//   CommunityChatBlocBloc get communityChatBlocBloc => read<CommunityChatBlocBloc>();
//   CommunityChatBlocState get communityChatBlocBlocState => communityChatBlocBloc.state;

//   void addCommunityChatBlocEvent(CommunityChatBlocEvent event) {
//     communityChatBlocBloc.add(event);
//   }

//   void init() {
//     addCommunityChatBlocEvent(InitEvent());
//   }
// }

class CommunityChatBlocBloc
    extends Bloc<CommunityChatBlocEvent, GetGroupState> {
  Communitydatasourses datasources;
  CommunityChatBlocBloc({required this.datasources})
      : super(InitGetGroupState()) {
    on<getGroups>(_getGroups);
    on<GetSelectGroup>(_GetSelectGroup);
  }

  void _getGroups(getGroups event, Emitter<GetGroupState> emit) async {
    emit(GetGroupLoading());
    var response = await datasources.GetAllGroup();

    response.fold((ifLeft) {
      emit(GetGroupFailure());
    }, (ifRight) {
      emit(GetGroupSuccess(groupsResponse: ifRight));
    });
  }

  void _GetSelectGroup(
      GetSelectGroup event, Emitter<GetGroupState> emit) async {
    emit(GetGroupLoading());
    emit(selectGroupSuccess());
  }
}
