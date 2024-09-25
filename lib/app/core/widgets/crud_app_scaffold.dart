import 'package:asp/asp.dart';
import 'package:crud_app/app/modules/auth/auth_atom.dart';
import 'package:crud_app/routes.g.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class CrudAppScaffold extends StatelessWidget {
  final Widget child;
  final Widget? title;

  const CrudAppScaffold({
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
                        Routefly.navigate(routePaths.login);
                      },
                      child: const Text('Login'),
                    )
                  : Text(get($currentUser)?.email ?? ''),
              ElevatedButton(
                onPressed: () {
                  Routefly.navigate(routePaths.products.path);
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
