import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  int id;
  String title;
  String description;
  double price;
  double? discountPercentage;
  double? rating;
  int stock;
  String brand;
  String category;
  String? thumbnail;
  List<String> images;
  bool isOnCart;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.discountPercentage,
    this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    this.thumbnail,
    List<String>? images,
    this.isOnCart = false,
  }) : images = images ?? [];

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
