import 'package:crud_app/src/app.dart';
import 'package:crud_app/src/injector.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

void main() {
  registerInstances();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  Intl.defaultLocale = 'pt_BR';
  runApp(const CrudApp());
}
