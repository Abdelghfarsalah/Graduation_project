import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/recommendChat/domain/models/RoadmapModel%20.dart';

import 'reccomend_chat_bloc_event.dart';
import 'reccomend_chat_bloc_state.dart';

class ReccomendChatBlocBloc
    extends Bloc<ReccomendChatBlocEvent, ReccomendChatBlocState> {
  List<Roadmapmodel2> chat = [];

  List<Map<String, dynamic>> SaveRoadmapsToStartLearning = [];
  bool bottom = true;
  String track = "";
  late Roadmapmodel2 roadmap;
  final Dio dio;
  final TextEditingController controller = TextEditingController();
  ReccomendChatBlocBloc({required this.dio}) : super(Initrecommendstate()) {
    on<Fetchroadmap>(_onFetchData);
    on<AddMessage>(_onAddMessage);
    on<ClearMessages>(_onClearMessages);
    on<FetchroadmapwithQuestion>(_FetchroadmapwithQuestion);
    on<ScrollToStart>(_onScrollToStart);
    on<ScrollToEnd>(_onScrollToEnd);
  }

  Future<void> _onFetchData(
      Fetchroadmap event, Emitter<ReccomendChatBlocState> emit) async {
    chat.add(Roadmapmodel2(title: event.text, fromuser: true));
    emit(Loading());
    try {
      track = event.text;
      var response = await dio.post(
          "http://164.128.130.9:8000/generate-roadmap",
          data: {"track": event.text});

      print(response.data);
      SaveRoadmapsToStartLearning.add(response.data);
      roadmap = Roadmapmodel2.fromJson(response.data);
      chat.add(roadmap);
      emit(SuccessRoadmapstate(
          Roadmapindex: SaveRoadmapsToStartLearning.length - 1));
    } catch (e) {
      print(e.toString());
      emit(Failuer());
    }
  }

  Future<void> _FetchroadmapwithQuestion(FetchroadmapwithQuestion event,
      Emitter<ReccomendChatBlocState> emit) async {
    chat.add(Roadmapmodel2(title: event.Question, fromuser: true));
    print(event.Question);
    emit(Loading());
    try {
      String jsonString = jsonEncode(roadmap.toJson());
      String escaped = jsonEncode(jsonString);
      print(jsonString);

      var response = await dio
          .post("http://164.128.130.9:8000/generate-roadmap", data: {
        "track": track,
        "question": event.Question,
        "roadmap": "$escaped"
      });

      SaveRoadmapsToStartLearning.add(response.data);
      chat.add(Roadmapmodel2.fromJson(response.data));
      roadmap = response.data["roadmap"];
      emit(SuccessRoadmapstate(
          Roadmapindex: SaveRoadmapsToStartLearning.length - 1));
    } catch (e) {
      print(e.toString());
      emit(Failuer());
    }
  }

  void _onAddMessage(AddMessage event, Emitter<ReccomendChatBlocState> emit) {
    // chat.add(event.message);
    emit(SuccessRoadmapstate(
        Roadmapindex: SaveRoadmapsToStartLearning.length - 1));
  }

  void _onClearMessages(
      ClearMessages event, Emitter<ReccomendChatBlocState> emit) {
    chat.clear();
    track = "";

    SaveRoadmapsToStartLearning.clear();
    emit(clearstate());
  }

  void _onScrollToStart(
      ScrollToStart event, Emitter<ReccomendChatBlocState> emit) {
    bottom = false;

    emit(scrollstate());
  }

  void _onScrollToEnd(ScrollToEnd event, Emitter<ReccomendChatBlocState> emit) {
    bottom = true;
    emit(scrollstate());
  }
}
