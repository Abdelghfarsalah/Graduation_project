import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/recommendChat/domain/RoadmapModel%20.dart';

import 'reccomend_chat_bloc_event.dart';
import 'reccomend_chat_bloc_state.dart';

class ReccomendChatBlocBloc
    extends Bloc<ReccomendChatBlocEvent, ReccomendChatBlocState> {
  List<Roadmapmodel> chat = [];
  bool bottom = true;
  String track = "";
  late Roadmapmodel roadmap;
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
    chat.add(Roadmapmodel(title: event.text, fromuser: true));
    emit(Loading());
    try {
      print(
          "=========================================loading===================================");
      track = event.text;
      var response = await dio.post(
          "http://164.128.130.9:8000/generate-roadmap",
          data: {"track": event.text});
      print(
          "===============success=============================================================");
      print(response.data);
      roadmap = Roadmapmodel.fromJson(response.data);
      chat.add(roadmap);
      emit(SuccessRoadmapstate());
    } catch (e) {
      print(e.toString());
      emit(Failuer());
    }
  }

  // void addtochat(FlutterRoadmapModel model) {
  //   emit(Loading());
  //   chat.add(model);
  //   emit(Success());
  // }

  Future<void> _FetchroadmapwithQuestion(FetchroadmapwithQuestion event,
      Emitter<ReccomendChatBlocState> emit) async {
    chat.add(Roadmapmodel(title: event.Question, fromuser: true));
    print(event.Question);
    emit(Loading());
    try {
      print(
          "=============${track}===========================dfdfd===============================");
      print(roadmap.title);
      print(event.Question);
      var response = await dio
          .post("http://164.128.130.9:8000/generate-roadmap", data: {
        "track": track,
        "roadmap": roadmap.toJson(),
        "question": event.Question
      });
      chat.add(Roadmapmodel.fromJson(response.data));

      roadmap = response.data["roadmap"];
      emit(SuccessRoadmapstate());
    } catch (e) {
      print(e.toString());
      emit(Failuer());
    }
  }

  void _onAddMessage(AddMessage event, Emitter<ReccomendChatBlocState> emit) {
    // chat.add(event.message);
    emit(SuccessRoadmapstate());
  }

  void _onClearMessages(
      ClearMessages event, Emitter<ReccomendChatBlocState> emit) {
    chat.clear();
    track = "";
    emit(clearstate());
  }

  void _onScrollToStart(
      ScrollToStart event, Emitter<ReccomendChatBlocState> emit) {
    bottom = false;
    emit(SuccessRoadmapstate());
  }

  void _onScrollToEnd(ScrollToEnd event, Emitter<ReccomendChatBlocState> emit) {
    bottom = true;
    emit(SuccessRoadmapstate());
  }
}
