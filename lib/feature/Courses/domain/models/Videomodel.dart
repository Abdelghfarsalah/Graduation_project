class Video {
  final String id;
  final String title;
  final String videoUrl;
  final int duration;
  final bool watched;

  Video({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.duration,
    required this.watched,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['_id'],
      title: json['title'],
      videoUrl: json['videoUrl'],
      duration: json['duration'],
      watched: json['watched'],
    );
  }
}
