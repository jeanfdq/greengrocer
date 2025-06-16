// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:greengrocer/models/product_item_model.dart';

class CartItemModel {
  ProductItemModel item;
  int quantity;
  CartItemModel({required this.item, required this.quantity});

  CartItemModel copyWith({ProductItemModel? item, int? quantity}) {
    return CartItemModel(
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
    );
  }

  double totalPrice() => quantity * item.price;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'item': item.toMap(), 'quantity': quantity};
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      item: ProductItemModel.fromMap(map['item'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromJson(String source) =>
      CartItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CartItemModel(item: $item, quantity: $quantity)';

  @override
  bool operator ==(covariant CartItemModel other) {
    if (identical(this, other)) return true;

    return other.item == item && other.quantity == quantity;
  }

  @override
  int get hashCode => item.hashCode ^ quantity.hashCode;
}
