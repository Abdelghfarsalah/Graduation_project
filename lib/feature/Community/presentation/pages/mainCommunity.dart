import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utils/SharedPreferencesDemo.dart';
import 'package:graduation_project/feature/Community/presentation/manager/chnage_chat/chnage_chat_bloc.dart';
import 'package:graduation_project/feature/Community/presentation/manager/community_chat_bloc/community_chat_bloc_bloc.dart';
import 'package:graduation_project/feature/Community/presentation/manager/community_chat_bloc/community_chat_bloc_event.dart';
import 'package:graduation_project/feature/Community/presentation/manager/community_chat_bloc/community_chat_bloc_state.dart';
import 'package:graduation_project/feature/Community/presentation/pages/Communitypage.dart';
import 'package:graduation_project/feature/Community/presentation/pages/widgets/ShimmerforEntryChat.dart';

class Maincommunity extends StatefulWidget {
  const Maincommunity({super.key});

  @override
  State<Maincommunity> createState() => _MaincommunityState();
}

class _MaincommunityState extends State<Maincommunity> {
  @override
  void initState() {
    super.initState();
    getGroupName();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CommunityChatBlocBloc>().add(getGroups());
    });
  }

  String? name = "";
  Future<void> getGroupName() async {
    name = await SharedPreferencesDemo.getGroupName() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommunityChatBlocBloc, GetGroupState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetGroupSuccess) {
          if (name!.length == 0) {
            context.read<ChnageChatBloc>().currentgroup =
                state.groupsResponse.data.groups[1];
          } else {
            final groupsList = state.groupsResponse.data.groups;
            final matchingGroup = groupsList.firstWhere((g) => g.name == name);
            context.read<ChnageChatBloc>().currentgroup = matchingGroup;
          }
          return Communitypage(
            groupsResponse: state.groupsResponse,
          );
        } else {
          return FullChatShimmer();
        }
      },
    );
  }
}
