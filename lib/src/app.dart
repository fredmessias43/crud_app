import 'package:crud_app/src/core/router/router.dart';
import 'package:flutter/material.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Crud App",
      routerConfig: router,
    );
  }
}
