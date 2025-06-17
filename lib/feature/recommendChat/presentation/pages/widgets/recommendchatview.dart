import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/recommendChat/presentation/manager/reccomend_chat_bloc_bloc.dart';
import 'package:graduation_project/feature/recommendChat/presentation/manager/reccomend_chat_bloc_state.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/widgets/LoadingAnalog.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/widgets/RoadmapEmptyContent.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/widgets/agentMessage.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/widgets/customfiledforrecommendchat.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/widgets/showCustomErrorDialog.dart';
import 'package:graduation_project/feature/recommendChat/presentation/pages/widgets/userMessage.dart';

class Recommendchatview extends StatefulWidget {
  const Recommendchatview({super.key});

  @override
  State<Recommendchatview> createState() => _StreamViewState();
}

class _StreamViewState extends State<Recommendchatview> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _scrollToBottom() {
    print("object");
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
    var bloc = context.read<ReccomendChatBlocBloc>();
    return BlocConsumer<ReccomendChatBlocBloc, ReccomendChatBlocState>(
      listener: (context, state) {
        var bloc = context.read<ReccomendChatBlocBloc>();
        if (bloc.bottom) {
          _scrollToBottom();
        } else {
          _returnToStart();
        }
      },
      builder: (context, state) {
        return BlocConsumer<ReccomendChatBlocBloc, ReccomendChatBlocState>(
          listener: (context, state) {
            if (state is Loading) {
              showLoadingAnalog(context);
            } else if (state is SuccessRoadmapstate || state is Failuer) {
              Navigator.of(context).pop(); // Close the dialog
            }
            if (state is Failuer) {
              context
                  .read<ReccomendChatBlocBloc>()
                  .SaveRoadmapsToStartLearning
                  .clear();
              context.read<ReccomendChatBlocBloc>().chat.clear();
              // Fluttertoast.showToast(
              //   msg: "${state.message}",
              //   toastLength: Toast.LENGTH_LONG,
              //   gravity: ToastGravity.CENTER,
              //   backgroundColor: appColor.Primarycolor, // Green color
              //   textColor: Colors.white,
              //   fontSize: 16.0,
              // );

              showTechTrackErrorDialog(context, state.userMessage);
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                context.read<ReccomendChatBlocBloc>().chat.length == 0
                    ? CreateLearningMapPage()
                    : Expanded(
                        child: ListView.builder(
                          itemCount:
                              context.read<ReccomendChatBlocBloc>().chat.length,
                          controller: _scrollController,
                          itemBuilder: (context, index) {
                            var fromuser = context
                                    .read<ReccomendChatBlocBloc>()
                                    .chat[index]
                                    .fromuser ??
                                false;
                            return fromuser
                                ? Usermessage(text: bloc.chat[index].title!)
                                : Agentmessage(
                                    text: context
                                        .read<ReccomendChatBlocBloc>()
                                        .chat[index],
                                    indexTOgetDataForStartLearning:
                                        ((index - 1) / 2).toInt(),
                                  );
                          },
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom),
                  child: customfiledforrecommendchat(),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

/**
 * 
 * BlocConsumer<BotBloc, StateBot>(listener: (context, state) {
      var bloc = context.read<BotBloc>();
      if (bloc.bottom) {
        _scrollToBottom();
      } else {
        _returnToStart();
      }
    },
 */
