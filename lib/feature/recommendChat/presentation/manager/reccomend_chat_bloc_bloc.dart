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

    Response? response;
    try {
      response = await dio.post("http://164.128.130.9:8000/generate-roadmap",
          data: {"track": event.text});

      print(response.data);
      SaveRoadmapsToStartLearning.add(response.data);
      roadmap = Roadmapmodel2.fromJson(response.data);
      chat.add(roadmap);

      track = event.text;
      emit(SuccessRoadmapstate(
          Roadmapindex: SaveRoadmapsToStartLearning.length - 1));
    } catch (e) {
      // print(e.toString());
      // log(response.toString());
      // emit(Failuer(message: "response!.data"));
      if (e is DioException) {
        final errorResponse = e.response;
        String errorMessage = "فشل الاتصال بالسيرفر";

        if (errorResponse != null && errorResponse.data != null) {
          if (errorResponse.data is Map &&
              errorResponse.data.containsKey("detail")) {
            errorMessage = errorResponse.data["detail"];
          } else if (errorResponse.data is String) {
            errorMessage = errorResponse.data;
          }
        }

        emit(Failuer(
          message: errorMessage,
          userMessage: event.text,
        ));
      } else {
        emit(Failuer(
          message: "حدث خطأ غير متوقع: ${e.toString()}",
          userMessage: event.text,
        ));
      }
    }
  }

  Future<void> _FetchroadmapwithQuestion(
    FetchroadmapwithQuestion event,
    Emitter<ReccomendChatBlocState> emit,
  ) async {
    // 1) أضف سؤال المستخدم للـ chat
    chat.add(Roadmapmodel2(title: event.Question, fromuser: true));
    emit(Loading());

    try {
      // 2) اعمل JSON encode أول مرة من موديل Roadmapmodel2
      String jsonString = jsonEncode(roadmap.toJson());
      // 3) اعمل JSON encode ثانية على النتيجة السابقة
      String doubleEncoded = jsonEncode(jsonString);

      print("First encode:  $jsonString");
      print("Second encode: $doubleEncoded");

      // 4) أرسل payload، مع `roadmap` كـ string مش كـ Map
      final response = await dio.post(
        "http://164.128.130.9:8000/generate-roadmap",
        data: {
          "track": track,
          "question": event.Question,
          "roadmap": doubleEncoded,
        },
      );

      print("Server replied: ${response.data}");

      // 5) خزن النتيجة الخام
      SaveRoadmapsToStartLearning.add(response.data);

      // 6) ابني الموديل الجديد من response.root
      final newRoadmap = Roadmapmodel2.fromJson(response.data);
      chat.add(newRoadmap);

      if (response.data["roadmap"] != null) {
        // نفترض إنه مشفّر مرتين، فنعمل decode مرتين
        String nestedDouble = response.data["roadmap"];
        // أول decode تخرج String (تكون الـ JSON الأصلية)
        String nestedOnce = jsonDecode(nestedDouble);
        // ثاني decode تخرج Map
        final Map<String, dynamic> nestedMap = jsonDecode(nestedOnce);
        roadmap = Roadmapmodel2.fromJson(nestedMap);
      } else {
        // وإلا خد الـ newRoadmap ككل
        roadmap = newRoadmap;
      }

      emit(SuccessRoadmapstate(
        Roadmapindex: SaveRoadmapsToStartLearning.length - 1,
      ));
    } catch (e, st) {
      print("Error in _FetchroadmapwithQuestion:\n$e\n$st");
      emit(Failuer(message: e.toString(), userMessage: ''));
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
