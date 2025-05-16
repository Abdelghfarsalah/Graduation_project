import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    extends Bloc<CommunityChatBlocEvent, CommunityChatBlocState> {
  CommunityChatBlocBloc() : super(CommunityChatBlocState()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<CommunityChatBlocState> emit) async {
    emit(state.clone());
  }
}
