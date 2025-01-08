import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:crud_app/src/core/contracts/model.dart';

class RouteModel extends Model {
  final String title;
  final IconData icon;
  final Color color;
  final String? description;
  final Uri? externalUrl;
  final String path;
  final String name;
  final List<String> breadcrumb;
  final String? fullPath;
  final Map<String, String>? pathParameters;
  final Map<String, dynamic>? queryParameters;
  final Object? extra;

  RouteModel({
    super.id,
    required this.title,
    required this.icon,
    required this.color,
    required this.path,
    required this.name,
    this.description,
    this.breadcrumb = const [],
    this.fullPath,
    this.externalUrl,
    this.pathParameters = const {},
    this.queryParameters = const {},
    this.extra,
  });

  RouteModel copyWith({
    String? id,
    String? title,
    IconData? icon,
    Color? color,
    List<String>? breadcrumb,
    String? description,
    String? path,
    String? name,
    String? fullPath,
    Uri? externalUrl,
    Map<String, String>? pathParameters,
    Map<String, dynamic>? queryParameters,
    Object? extra,
  }) {
    return RouteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      breadcrumb: breadcrumb ?? this.breadcrumb,
      description: description ?? this.description,
      externalUrl: externalUrl ?? this.externalUrl,
      path: path ?? this.path,
      name: name ?? this.name,
      fullPath: fullPath ?? this.fullPath,
      pathParameters: pathParameters ?? this.pathParameters,
      queryParameters: queryParameters ?? this.queryParameters,
      extra: extra ?? this.extra,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'icon': icon.codePoint,
      'color': color.value,
      'breadcrumb': breadcrumb,
      'description': description,
      'path': path,
      'name': name,
      'fullPath': fullPath,
      'pathParameters': pathParameters,
      'queryParameters': queryParameters,
      'extra': extra,
    };
  }

  @override
  factory RouteModel.fromMap(Map<String, dynamic> map) {
    return RouteModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] as String,
      icon: IconData(
        map['icon'] as int,
        fontFamilyFallback: const ["CupertinoIcons", "MaterialIcons"],
      ),
      color: Color(map['color'] as int),
      breadcrumb: map['breadcrumb'] is List
          ? (map['breadcrumb'] as List).map((item) => item as String).toList()
          : [],
      description: map['description'],
      path: map['path'] as String,
      name: map['name'] as String,
      fullPath: map['fullPath'],
      pathParameters: Map<String, String>.from(map["pathParameters"] ?? {}),
      queryParameters: Map<String, String>.from(map["queryParameters"] ?? {}),
      extra: map['extra'],
    );
  }
}
