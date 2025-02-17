import 'package:flutter/material.dart';

abstract class BotEvent {}

class FetchData extends BotEvent {
  final String text;
  FetchData(this.text);
}

class AddMessage extends BotEvent {
  final Widget message;
  AddMessage(this.message);
}

class ClearMessages extends BotEvent {}

class ScrollToStart extends BotEvent {}

class ScrollToEnd extends BotEvent {}
