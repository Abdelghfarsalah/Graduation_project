import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/chat/presentation/manager/chatbloc.dart';
import 'package:graduation_project/feature/chat/presentation/manager/chatstate.dart';
import 'package:graduation_project/feature/chat/presentation/widget/EmptyState.dart';
import 'package:graduation_project/feature/chat/presentation/widget/TextFiledcustom.dart';

class StreamView extends StatefulWidget {
  const StreamView({super.key});

  @override
  State<StreamView> createState() => _StreamViewState();
}

class _StreamViewState extends State<StreamView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  void _returnToStart() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.minScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BotBloc, StateBot>(listener: (context, state) {
      var bloc = context.read<BotBloc>();
      if (bloc.bottom) {
        _scrollToBottom();
      } else {
        _returnToStart();
      }
    }, builder: (context, state) {
      var bloc = context.read<BotBloc>();
      return Column(
        children: [
          bloc.chat.isEmpty
              ? Emptystatepage()
              : Expanded(
                  child: ListView.builder(
                    itemCount: bloc.chat.length,
                    controller: _scrollController,
                    itemBuilder: (context, index) => bloc.chat[index],
                  ),
                ),
          Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            child: Textfiledcustom(bloc: bloc),
          ),
        ],
      );
    });
  }
}
