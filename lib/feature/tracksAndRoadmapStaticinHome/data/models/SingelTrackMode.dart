class SingleTrackModel {
  final bool success;
  final String message;
  final TrackData data;

  SingleTrackModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SingleTrackModel.fromJson(Map<String, dynamic> json) {
    return SingleTrackModel(
      success: json['success'],
      message: json['message'],
      data: TrackData.fromJson(json['data']),
    );
  }
}

class TrackData {
  final Track track;
  final List<Roadmap> roadmaps;

  TrackData({
    required this.track,
    required this.roadmaps,
  });

  factory TrackData.fromJson(Map<String, dynamic> json) {
    return TrackData(
      track: Track.fromJson(json['track']),
      roadmaps:
          (json['roadmaps'] as List).map((e) => Roadmap.fromJson(e)).toList(),
    );
  }
}

class Track {
  final String id;
  final String title;
  final String icon;
  final String body;
  String? createdAt;
  String? updatedAt;

  Track({
    required this.id,
    required this.title,
    required this.icon,
    required this.body,
    this.createdAt,
    this.updatedAt,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      id: json['_id'],
      title: json['title'],
      icon: json['icon'],
      body: json['body'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class Roadmap {
  final String id;
  final String title;
  final String icon;
  final String link;

  Roadmap({
    required this.id,
    required this.title,
    required this.icon,
    required this.link,
  });

  factory Roadmap.fromJson(Map<String, dynamic> json) {
    return Roadmap(
      id: json['_id'],
      title: json['title'],
      icon: json['icon'],
      link: json['link'],
    );
  }
}
