import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/course_progress/course_progress_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/mark_video_aswatched/mark_video_aswatched_bloc.dart';
import 'package:graduation_project/feature/Courses/presentation/manager/mark_video_aswatched/mark_video_aswatched_event.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubePlayer extends StatefulWidget {
  final String videoUrl;
  final String videoiId;
  final String courseId;
  final String id;
  final String title;
  final bool watched;
  const CustomYoutubePlayer({
    super.key,
    required this.videoUrl,
    required this.title,
    required this.id,
    required this.watched,
    required this.videoiId,
    required this.courseId,
  });

  @override
  State<CustomYoutubePlayer> createState() => _CustomYoutubePlayerState();
}

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
  late YoutubePlayerController _youtubeController;
  bool _reachedTargetTime = false;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: widget.videoiId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  void _videoListener() {
    final position = _youtubeController.value.position;
    final duration = _youtubeController.metadata.duration;

    if (duration.inSeconds > 0) {
      final progress = position.inSeconds / duration.inSeconds;

      if (progress >= 0.9 && !_reachedTargetTime) {
        _reachedTargetTime = true;

        final watchedMap = context.read<CourseProgressBloc>().watchedMap;
        final hasWatched = watchedMap[widget.id] ?? false;

        if (!widget.watched && mounted && !hasWatched) {
          context.read<MarkVideoAswatchedBloc>().add(
                MarkvideoAsWatched(
                  courseID: widget.courseId,
                  videoID: widget.id,
                ),
              );
        }
      }
    }
  }

  @override
  void didUpdateWidget(covariant CustomYoutubePlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoiId != widget.videoiId) {
      _youtubeController.load(widget.videoiId);

      _youtubeController.removeListener(_videoListener);
      _youtubeController.addListener(_videoListener);
    }
  }

  @override
  void dispose() {
    _youtubeController.removeListener(_videoListener);
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _youtubeController,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        progressColors: const ProgressBarColors(
          playedColor: Colors.blue,
          handleColor: Colors.blueAccent,
        ),
        onReady: () {
          _reachedTargetTime = false;
          _youtubeController.removeListener(_videoListener);
          _youtubeController.addListener(_videoListener);
        },
      ),
      builder: (context, player) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          player,
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
