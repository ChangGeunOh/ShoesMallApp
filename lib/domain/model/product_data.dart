import 'package:json_annotation/json_annotation.dart';

part 'product_data.g.dart';

@JsonSerializable()
class ProductData {
  final int id;
  final double price;
  final String title;
  final String image;
  final String brandImage;
  final String description;

  ProductData({
    required this.id,
    required this.price,
    required this.title,
    required this.image,
    required this.brandImage,
    required this.description,
  });

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
}
