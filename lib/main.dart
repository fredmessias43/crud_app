import 'package:crud_app/app/app.dart';
import 'package:crud_app/app/injector.dart';
import 'package:flutter/material.dart';

void main() {
  registerInstances();
  runApp(const CrudApp());
}
