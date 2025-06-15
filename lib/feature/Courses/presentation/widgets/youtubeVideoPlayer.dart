import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubePlayer extends StatefulWidget {
  final String videoUrl;
  final String videoiId;
  final String courseId;
  final String title;

  const CustomYoutubePlayer({
    super.key,
    required this.videoUrl,
    required this.title,
    required this.videoiId,
    required this.courseId,
  });

  @override
  State<CustomYoutubePlayer> createState() => _CustomYoutubePlayerState();
}

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  void _initController() {
    _youtubeController = YoutubePlayerController(
      initialVideoId: widget.videoiId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  /// ✅ أهم إضافة: تحديث الفيديو عند تغيّر الـ videoId
  @override
  void didUpdateWidget(covariant CustomYoutubePlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoiId != widget.videoiId) {
      _youtubeController.load(widget.videoiId);
    }
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YoutubePlayer(
          controller: _youtubeController,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          progressColors: const ProgressBarColors(
            playedColor: Colors.blue,
            handleColor: Colors.blueAccent,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
          ),
        )
      ],
    );
  }
}
