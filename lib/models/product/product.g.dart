// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      productId: json['productId'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
      totalQuantity: (json['totalQuantity'] as num).toDouble(),
      quantityType: json['quantityType'] as String,
      lowQuantity: json['lowQuantity'] as int,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'totalQuantity': instance.totalQuantity,
      'quantityType': instance.quantityType,
      'lowQuantity': instance.lowQuantity,
    };
