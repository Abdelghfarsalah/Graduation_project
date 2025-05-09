import 'package:flutter/material.dart';

abstract class ReccomendChatBlocEvent {}

class Fetchroadmap extends ReccomendChatBlocEvent {
  final String text;
  Fetchroadmap(this.text);
}

class AddMessage extends ReccomendChatBlocEvent {
  final Widget message;
  AddMessage(this.message);
}

class ClearMessages extends ReccomendChatBlocEvent {}

class ScrollToStart extends ReccomendChatBlocEvent {}

class ScrollToEnd extends ReccomendChatBlocEvent {}

class FetchroadmapwithQuestion extends ReccomendChatBlocEvent {
  final String Question;
  FetchroadmapwithQuestion({required this.Question});
}
