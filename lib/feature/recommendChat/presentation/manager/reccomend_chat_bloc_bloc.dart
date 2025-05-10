import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/recommendChat/domain/model.dart';

import 'reccomend_chat_bloc_event.dart';
import 'reccomend_chat_bloc_state.dart';

// extension ReccomendChatBlocBlocExt on BuildContext {
//   ReccomendChatBlocBloc get reccomendChatBlocBloc => read<ReccomendChatBlocBloc>();
//   ReccomendChatBlocState get reccomendChatBlocBlocState => reccomendChatBlocBloc.state;

//   void addReccomendChatBlocEvent(ReccomendChatBlocEvent event) {
//     reccomendChatBlocBloc.add(event);
//   }

//   void init() {
//     addReccomendChatBlocEvent(InitEvent());
//   }
// }

class ReccomendChatBlocBloc
    extends Bloc<ReccomendChatBlocEvent, ReccomendChatBlocState> {
  List<FlutterRoadmapModel> chat = [];
  bool bottom = true;
  String track = "";
  String roadmap = "";
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
    chat.add(FlutterRoadmapModel(
        track: event.text, fromuser: true, roadmap: '', question: event.text));
    emit(Loading());
    try {
      print(
          "============================================================================");
      track = event.text;
      var response = await dio.post(
          "https://agent-production-bc22.up.railway.app/generate-roadmap",
          data: {"track": event.text});
      print(
          "============================================================================");

      chat.add(FlutterRoadmapModel.fromJson(response.data));
      print(chat[chat.length - 1].roadmap);
      roadmap = response.data["roadmap"];
      print(roadmap);

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
    chat.add(FlutterRoadmapModel(
        track: '', fromuser: true, roadmap: '', question: event.Question));
    print(event.Question);
    emit(Loading());
    try {
      print(
          "=============${track}===========================dfdfd=====================${roadmap.length}===============");
      var response = await dio.post(
          "https://agent-production-bc22.up.railway.app/generate-roadmap",
          data: {
            "track": track,
            "roadmap": roadmap,
            "question": event.Question
          });
      chat.add(FlutterRoadmapModel.fromJson(response.data));
      print(chat[chat.length - 1].roadmap);
      print(roadmap);
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
    roadmap = "";
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
