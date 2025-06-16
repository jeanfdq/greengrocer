// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductItemModel {
  String name;
  String imageURL;
  String unit;
  String descript;
  double price;
  ProductItemModel({
    required this.name,
    required this.imageURL,
    required this.unit,
    required this.descript,
    required this.price,
  });

  ProductItemModel copyWith({
    String? name,
    String? imageURL,
    String? unit,
    String? descript,
    double? price,
  }) {
    return ProductItemModel(
      name: name ?? this.name,
      imageURL: imageURL ?? this.imageURL,
      unit: unit ?? this.unit,
      descript: descript ?? this.descript,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageURL': imageURL,
      'unit': unit,
      'descript': descript,
      'price': price,
    };
  }

  factory ProductItemModel.fromMap(Map<String, dynamic> map) {
    return ProductItemModel(
      name: map['name'] as String,
      imageURL: map['imageURL'] as String,
      unit: map['unit'] as String,
      descript: map['descript'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductItemModel.fromJson(String source) =>
      ProductItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductItemModel(name: $name, imageURL: $imageURL, unit: $unit, descript: $descript, price: $price)';
  }

  @override
  bool operator ==(covariant ProductItemModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.imageURL == imageURL &&
        other.unit == unit &&
        other.descript == descript &&
        other.price == price;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        imageURL.hashCode ^
        unit.hashCode ^
        descript.hashCode ^
        price.hashCode;
  }
}
