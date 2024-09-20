import 'package:crud_app/src/core/contracts/model.dart';

class ProductModel extends Model {
  @override
  final String? id;
  final String name;
  final String description;

  ProductModel({
    this.id,
    required this.name,
    required this.description,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  @override
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }
}
