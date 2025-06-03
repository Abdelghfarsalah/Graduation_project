class Trackforonlycources {
  final String id;
  final String title;

  Trackforonlycources({required this.id, required this.title});

  factory Trackforonlycources.fromJson(Map<String, dynamic> json) {
    return Trackforonlycources(
      id: json['_id'],
      title: json['title'],
    );
  }
}
