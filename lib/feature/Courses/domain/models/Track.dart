class Track {
  final String title;

  Track({required this.title});

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(title: json['title']);
  }
}
