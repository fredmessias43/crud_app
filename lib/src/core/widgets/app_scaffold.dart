import 'package:asp/asp.dart';
import 'package:crud_app/src/core/router/route_config.dart';
import 'package:crud_app/src/core/router/route_data.dart';
import 'package:crud_app/src/modules/auth/auth_atom.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final Widget? title;

  const AppScaffold({
    super.key,
    required this.child,
    this.title = const Text('Crud App'),
  });

  @override
  Widget build(BuildContext context) {
    return AtomBuilder(
      builder: (context, get) {
        return Scaffold(
          appBar: AppBar(
            title: title,
            actions: [
              !get($isLogged)
                  ? ElevatedButton(
                      onPressed: () {
                        RouteConfig.push(RoutePath.login.name);
                      },
                      child: const Text('Login'),
                    )
                  : Text(get($currentUser)?.email ?? ''),
              ElevatedButton(
                onPressed: () {
                  RouteConfig.push(RoutePath.productsIndex.name);
                },
                child: const Text('Products'),
              ),
            ],
          ),
          body: child,
        );
      },
    );
  }
}
