class ItemModel {
  final String? title;
  final String? link;

  ItemModel({
    this.title,
    this.link,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      title: json['title'],
      link: json['link'],
    );
  }
}
