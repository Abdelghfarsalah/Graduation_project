import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:graduation_project/feature/chat/presentation/manager/chatevent.dart';
import 'package:graduation_project/feature/chat/presentation/manager/chatstate.dart';
import 'package:graduation_project/feature/chat/presentation/widget/MeesageHeader.dart';
import 'package:graduation_project/feature/chat/presentation/widget/recivesMessage.dart';

class BotBloc extends Bloc<BotEvent, StateBot> {
  final Gemini gemini = Gemini.instance;
  List<Widget> chat = [];
  bool bottom = true;

  final TextEditingController controller = TextEditingController();
  BotBloc() : super(Init()) {
    on<FetchData>(_onFetchData);
    on<AddMessage>(_onAddMessage);
    on<ClearMessages>(_onClearMessages);
    on<ScrollToStart>(_onScrollToStart);
    on<ScrollToEnd>(_onScrollToEnd);
  }

  Future<void> _onFetchData(FetchData event, Emitter<StateBot> emit) async {
    emit(Loading());
    try {
      await for (final value in gemini.streamGenerateContent(event.text)) {
        add(AddMessage(Meesageheader(
          text: value.output ?? "",
        )));
        add(AddMessage(messagefrombot(text: value.output ?? "")));
        add(AddMessage(SizedBox(height: 10)));
      }
      emit(Success());
    } catch (e) {
      log('FetchData Error', error: e);
    }
  }

  void _onAddMessage(AddMessage event, Emitter<StateBot> emit) {
    chat.add(event.message);
    emit(Success());
  }

  void _onClearMessages(ClearMessages event, Emitter<StateBot> emit) {
    chat.clear();
    emit(Success());
  }

  void _onScrollToStart(ScrollToStart event, Emitter<StateBot> emit) {
    bottom = false;
    emit(Success());
  }

  void _onScrollToEnd(ScrollToEnd event, Emitter<StateBot> emit) {
    bottom = true;
    emit(Success());
  }
}
