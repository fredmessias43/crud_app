import 'dart:async';

import 'package:crud_app/routes.g.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  FutureOr<RouteInformation> _authRoute(RouteInformation routeInformation) {
    if (routeInformation.state ) {
      return routeInformation.redirect(Uri.parse('/'));
    }

    return routeInformation;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Crud App",
      routerConfig: Routefly.routerConfig(
        routes: routes,
        middlewares: [
          _authMiddleware,
        ],
      ),
    );
  }
}


