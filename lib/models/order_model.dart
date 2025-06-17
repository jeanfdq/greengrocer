// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:greengrocer/models/cart_item_model.dart';

class OrderModel {
  String id;
  DateTime createdOrder;
  DateTime pixOverDue;
  List<CartItemModel> items;
  String status;
  String pixCopyAndPaste;
  double total;
  OrderModel({
    required this.id,
    required this.createdOrder,
    required this.pixOverDue,
    required this.items,
    required this.status,
    required this.pixCopyAndPaste,
    required this.total,
  });

  double totalPrice() {
    double total = 0;
    for (var item in items) {
      total += item.totalPrice();
    }
    return total;
  }

  OrderModel copyWith({
    String? id,
    DateTime? createdOrder,
    DateTime? pixOverDue,
    List<CartItemModel>? items,
    String? status,
    String? pixCopyAndPaste,
    double? total,
  }) {
    return OrderModel(
      id: id ?? this.id,
      createdOrder: createdOrder ?? this.createdOrder,
      pixOverDue: pixOverDue ?? this.pixOverDue,
      items: items ?? this.items,
      status: status ?? this.status,
      pixCopyAndPaste: pixCopyAndPaste ?? this.pixCopyAndPaste,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdOrder': createdOrder.millisecondsSinceEpoch,
      'pixOverDue': pixOverDue.millisecondsSinceEpoch,
      'items': items.map((x) => x.toMap()).toList(),
      'status': status,
      'pixCopyAndPaste': pixCopyAndPaste,
      'total': total,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as String,
      createdOrder: DateTime.fromMillisecondsSinceEpoch(
        map['createdOrder'] as int,
      ),
      pixOverDue: DateTime.fromMillisecondsSinceEpoch(map['pixOverDue'] as int),
      items: List<CartItemModel>.from(
        (map['items'] as List<int>).map<CartItemModel>(
          (x) => CartItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      status: map['status'] as String,
      pixCopyAndPaste: map['pixCopyAndPaste'] as String,
      total: map['total'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(id: $id, createdOrder: $createdOrder, pixOverDue: $pixOverDue, items: $items, status: $status, pixCopyAndPaste: $pixCopyAndPaste, total: $total)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.createdOrder == createdOrder &&
        other.pixOverDue == pixOverDue &&
        listEquals(other.items, items) &&
        other.status == status &&
        other.pixCopyAndPaste == pixCopyAndPaste &&
        other.total == total;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createdOrder.hashCode ^
        pixOverDue.hashCode ^
        items.hashCode ^
        status.hashCode ^
        pixCopyAndPaste.hashCode ^
        total.hashCode;
  }
}
