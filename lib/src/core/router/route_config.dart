import 'package:crud_app/src/core/router/route_data.dart';
import 'package:crud_app/src/core/router/route_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteConfig {
  static String? currentPath;
  static RouteModel? currentRouteModel;
  static BuildContext? currentContext;

  static void buildPage(BuildContext context, GoRouterState state, RouteModel routeModel) {
    currentPath = state.path!;
    currentContext = context;
    currentRouteModel = routeModel.copyWith(
      fullPath: state.matchedLocation,
      pathParameters: state.pathParameters,
      queryParameters: {},
      extra: state.extra,
    );
    debugPrint("buildPage ${routeModel.name}");
    debugPrint(currentRouteModel?.pathParameters.toString());
  }

  static void push(
    String routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    try {
      GoRouter.of(currentContext!).pushNamed(
        routeName,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static void replace(
    String routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    GoRouter.of(currentContext!).replaceNamed(
      routeName,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  static bool canPop() {
    return GoRouter.of(currentContext!).canPop();
  }

  static void pop() {
    if (GoRouter.of(currentContext!).canPop()) {
      // final lastRouteName = GoRouter.of(currentContext!).routerDelegate.currentConfiguration.last.route.name;
      GoRouter.of(currentContext!).pop();
    } else {
      push(RoutePath.inicio.name);
    }
  }
}
