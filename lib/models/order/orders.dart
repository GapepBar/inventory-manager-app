// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'orders.freezed.dart';
part 'orders.g.dart';

List<Orders> ordersFromJson(dynamic str) =>
    List<Orders>.from((str).map((e) => Orders.fromJson(e)));

@freezed
abstract class Orders with _$Orders {
  factory Orders(
      {required String orderId,
      required DateTime date,
      required String orderStatus,
      required List<Map<String, dynamic>> productsItem,
      required List<Map<String, dynamic>> billedItems,
      required double bill,
      required double deliveryCharges}) = _Order;

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);
}
