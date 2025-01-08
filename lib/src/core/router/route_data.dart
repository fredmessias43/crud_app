import 'package:crud_app/src/core/router/route_model.dart';
import 'package:crud_app/src/core/themes/default/icons.dart';
import 'package:crud_app/src/core/themes/theme.dart';

class RoutePath {
  // AUTH

  static RouteModel login = RouteModel(
    id: "1",
    color: AppTheme.currentColors.primary,
    icon: defaultIcons.home,
    path: "/login",
    name: "login",
    title: "login",
    breadcrumb: [],
  );

  static RouteModel register = RouteModel(
    id: "2",
    color: AppTheme.currentColors.primary,
    icon: defaultIcons.home,
    path: "/register",
    name: "register",
    title: "register",
    breadcrumb: [],
  );

  /////////////

  static RouteModel inicio = RouteModel(
    id: "3",
    color: AppTheme.currentColors.primary,
    icon: defaultIcons.home,
    path: "/",
    name: "inicio",
    title: "Início",
    breadcrumb: ["Início"],
  );
  static RouteModel productsIndex = RouteModel(
    id: "4",
    color: AppTheme.currentColors.primary,
    icon: defaultIcons.home,
    path: "/products",
    name: "products",
    title: "Products",
    breadcrumb: [],
  );
  static RouteModel productsCreate = RouteModel(
    id: "5",
    color: AppTheme.currentColors.primary,
    icon: defaultIcons.home,
    path: "/products/create",
    name: "productsCreate",
    title: "Products",
    breadcrumb: [],
  );
  static RouteModel productsEdit = RouteModel(
    id: "6",
    color: AppTheme.currentColors.primary,
    icon: defaultIcons.home,
    path: "/products/:productId/edit",
    name: "productsEdit",
    title: "Products",
    breadcrumb: [],
  );
}

RouteModel getRoutePath(String routeName) => switch (routeName) {
      "inicio" => RoutePath.inicio,
      "productsIndex" => RoutePath.productsIndex,
      "productsCreate" => RoutePath.productsCreate,
      "productsEdit" => RoutePath.productsEdit,
      _ => throw UnimplementedError("route name not found."),
    };
