import 'dart:convert';

abstract class Model {
  final String? id;
  Map<String, dynamic> toMap();
  factory Model.fromMap(Map<String, dynamic> map) {
    throw UnimplementedError();
  }

  String toJson() => jsonEncode(toMap());

  factory Model.fromJson(String source) =>
      Model.fromMap(jsonDecode(source) as Map<String, dynamic>);

  Model({this.id});
}
