import 'package:graduation_project/feature/recommendChat/domain/models/ItemModel.dart';

class CategoryModel {
  final String? categoryTitle;
  final List<ItemModel>? items;

  CategoryModel({this.categoryTitle, this.items});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryTitle: json['category_title'],
      items:
          (json['items'] as List?)?.map((e) => ItemModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_title': categoryTitle,
      'items': items?.map((e) => e.toJson()).toList(),
    };
  }
}
