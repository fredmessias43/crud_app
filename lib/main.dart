import 'package:crud_app/src/app.dart';
import 'package:crud_app/src/injector.dart';
import 'package:flutter/material.dart';

void main() {
  registerInstances();
  runApp(const CrudApp());
}
