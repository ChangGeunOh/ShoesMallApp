import 'package:json_annotation/json_annotation.dart';

part 'brand_data.g.dart';

@JsonSerializable()
class BrandData {
  final int id;
  final String name;
  final String image;

  BrandData({
    required this.id,
    required this.name,
    required this.image,
  });

  factory BrandData.fromJson(Map<String, dynamic> json) => _$BrandDataFromJson(json);
  Map<String, dynamic> toJson() => _$BrandDataToJson(this);
}
