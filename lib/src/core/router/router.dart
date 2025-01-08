import 'package:crud_app/src/core/router/route_config.dart';
import 'package:crud_app/src/core/router/route_data.dart';
import 'package:crud_app/src/core/router/route_model.dart';
import 'package:crud_app/src/pages/auth/login_page.dart';
import 'package:crud_app/src/pages/home_page.dart';
import 'package:crud_app/src/pages/products/products_index_page.dart';
import 'package:crud_app/src/pages/products/products_upsert_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    buildGoRoute(
      RoutePath.login,
      (_, __) => const LoginPage(),
    ),
    buildGoRoute(
      RoutePath.inicio,
      (_, __) => const HomePage(),
    ),
    buildGoRoute(
      RoutePath.productsIndex,
      (_, __) => const ProductIndexPage(),
    ),
    buildGoRoute(
      RoutePath.productsCreate,
      (_, __) => const ProductUpsertPage(),
    ),
    buildGoRoute(
      RoutePath.productsEdit,
      (_, __) => const ProductUpsertPage(),
    ),
  ],
);

GoRoute buildGoRoute(
  RouteModel routeModel,
  Widget Function(
    BuildContext context,
    GoRouterState state,
  ) builder,
) {
  return GoRoute(
    path: routeModel.path,
    name: routeModel.name,
    pageBuilder: (context, state) {
      RouteConfig.buildPage(context, state, routeModel);
      final child = builder(context, state);
      return MaterialPage(child: child);
    },
  );
}
