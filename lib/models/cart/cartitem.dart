// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import '../product/product.dart';
part 'cartitem.freezed.dart';
part 'cartitem.g.dart';

List<CartItem> cartitemFromJson(dynamic str) =>
    List<CartItem>.from((str).map((e) => CartItem.fromJson(e)));

@freezed
abstract class CartItem with _$CartItem {
  factory CartItem({required Product Item, required double ItemCount, required double price}) =
      _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
