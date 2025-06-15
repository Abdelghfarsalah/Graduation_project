import 'package:equatable/equatable.dart';

abstract class VideoplayerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitVideoplayerState extends VideoplayerState {}

class PlayingVideoState extends VideoplayerState {
  final String videoUrl;
  final String id;
  final String title;
  final String videoType;
  final String? youtubeId;

  PlayingVideoState({
    required this.videoUrl,
    required this.id,
    required this.title,
    required this.videoType,
    this.youtubeId,
  });

  @override
  List<Object?> get props => [videoUrl, id, videoType, youtubeId];
}

class PlayingVideoloading extends VideoplayerState {}
