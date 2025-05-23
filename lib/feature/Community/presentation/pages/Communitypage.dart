import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Community/data/models/groupsmodel.dart';
import 'package:graduation_project/feature/Community/presentation/manager/chnage_chat/chnage_chat_bloc.dart';
import 'package:graduation_project/feature/Community/presentation/manager/chnage_chat/chnage_chat_state.dart';
import 'package:graduation_project/feature/Community/presentation/pages/communityBody.dart';
import 'package:graduation_project/feature/Community/presentation/pages/widgets/DrawerItem.dart';
import 'package:graduation_project/feature/Community/presentation/pages/widgets/customappbar.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Communitypage extends StatefulWidget {
  const Communitypage({super.key, required this.groupsResponse});
  final GroupsResponse groupsResponse;
  @override
  State<Communitypage> createState() => _ChatPageState();
}

class _ChatPageState extends State<Communitypage> {
  GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    connectSocket();
  }

  late IO.Socket socket;

  void connectSocket() {
    try {
      socket = IO.io(
        "http://164.128.130.9:2530",
        IO.OptionBuilder().setTransports(['websocket']).build(),
      );

      socket.connect();
      socket.onConnect((_) {
        log("Joined group: groupId");
      });
      socket.onDisconnect((_) => log("Disconnected"));
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChnageChatBloc, ChangeChatState>(
        listener: (context, state) {
      if (state is ChangeChatSuccess) {
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      var bloc = context.read<ChnageChatBloc>().currentgroup;
      return Scaffold(
        key: key,
        drawer: Drawer(
          child: Draweritem(
            groupsResponse: widget.groupsResponse,
          ),
        ),
        // backgroundColor: Color(0xFF9DB89D),
        appBar: CustomappbarforCoummunity(
          scaffoldkey: key,
          currentgroup: bloc,
        ),
        body: Communitybody(
          key: ValueKey(bloc.id),
          group: bloc,
          socket: socket,
        ),
      );
    });
  }
}
