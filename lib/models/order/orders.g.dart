// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      orderId: json['orderId'] as String,
      date: DateTime.parse(json['date'] as String),
      orderStatus: json['orderStatus'] as String,
      productsItem: (json['productsItem'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      billedItems: (json['billedItems'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      bill: (json['bill'] as num).toDouble(),
      deliveryCharges: (json['deliveryCharges'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'date': instance.date.toIso8601String(),
      'orderStatus': instance.orderStatus,
      'productsItem': instance.productsItem,
      'billedItems': instance.billedItems,
      'bill': instance.bill,
      'deliveryCharges': instance.deliveryCharges,
    };
