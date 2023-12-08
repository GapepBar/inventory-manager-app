import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'product.freezed.dart';
part 'product.g.dart';

List<Product> productsFromJson(dynamic str) =>
    List<Product>.from((str).map((e) => Product.fromJson(e)));

@freezed
abstract class Product with _$Product {
  factory Product(
      {
        required String productId,
        required String name,
      required String imageUrl,
      required String description,
      required double totalQuantity,
      required String quantityType,
      required int lowQuantity,
      }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
