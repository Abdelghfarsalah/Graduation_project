class ItemModel {
  final String? title;
  final String? link;
  final String? duration;
  final String? typeOfLink;

  ItemModel({
    this.title,
    this.link,
    this.duration,
    this.typeOfLink,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      title: json['title'],
      link: json['link'],
      duration: json['duration'],
      typeOfLink: json['type_of_link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'link': link,
      'duration': duration,
      'type_of_link': typeOfLink,
    };
  }
}
