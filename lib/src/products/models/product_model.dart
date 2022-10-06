import 'dart:convert';

import 'package:uuid/uuid.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  late String id;
  String name;
  String description;

  ProductModel({
    id = String,
    required this.name,
    required this.description,
  }) {
    this.id = id ?? const Uuid().v4();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProductModel(id: $id, name: $name, description: $description)';
}
