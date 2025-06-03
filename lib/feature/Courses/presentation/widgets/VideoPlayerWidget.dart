import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final String videoiId;
  final String CourseId;

  const VideoPlayerWidget(
      {Key? key,
      required this.videoUrl,
      required this.videoiId,
      required this.CourseId})
      : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isMuted = false;
  bool _showControls = true;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
        _controller.play();
      });
    _controller.addListener(() {
      setState(() {}); // كل مرة يتغير الوقت، يحدث الواجهة
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0 : 1);
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  void _enterFullscreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Center(
              child: VideoPlayerWidget(
                videoUrl: widget.videoUrl,
                videoiId: widget.videoiId,
                CourseId: widget.CourseId,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialized
        ? GestureDetector(
            onTap: _toggleControls,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  VideoPlayer(_controller),
                  if (_showControls) ...[
                    VideoProgressIndicator(_controller, allowScrubbing: true),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(_controller.value.position),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                          Text(
                            _formatDuration(_controller.value.duration),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.replay_10,
                                color: Colors.white),
                            onPressed: () {
                              final pos = _controller.value.position -
                                  const Duration(seconds: 10);
                              _controller.seekTo(
                                  pos < Duration.zero ? Duration.zero : pos);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.forward_10,
                                color: Colors.white),
                            onPressed: () {
                              final pos = _controller.value.position +
                                  const Duration(seconds: 10);
                              _controller.seekTo(pos);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                                _isMuted ? Icons.volume_off : Icons.volume_up,
                                color: Colors.white),
                            onPressed: _toggleMute,
                          ),
                          IconButton(
                            icon: const Icon(Icons.fullscreen,
                                color: Colors.white),
                            onPressed: _enterFullscreen,
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          )
        : AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Container(
              decoration: BoxDecoration(color: Colors.black),
              child: Center(
                child: LoadingIndicator(
                    indicatorType: Indicator.ballScaleMultiple,
                    colors: const [
                      Color(0xFFF5F5F5),
                      Color.fromARGB(255, 108, 109, 109),
                      Color.fromARGB(255, 210, 210, 210),
                      Color.fromARGB(255, 98, 98, 99),
                      Color.fromARGB(255, 186, 186, 187),
                    ],
                    strokeWidth: 0,
                    backgroundColor: Colors.transparent,
                    pathBackgroundColor: Colors.transparent),
              ),
            ));
  }
}
