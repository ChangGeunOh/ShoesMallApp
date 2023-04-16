// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      id: json['id'] as int,
      price: (json['price'] as num).toDouble(),
      title: json['title'] as String,
      image: json['image'] as String,
      brandImage: json['brandImage'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'title': instance.title,
      'image': instance.image,
      'brandImage': instance.brandImage,
      'description': instance.description,
    };
