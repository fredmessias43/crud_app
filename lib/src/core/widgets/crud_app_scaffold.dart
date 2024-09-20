import 'package:asp/asp.dart';
import 'package:crud_app/src/modules/auth/auth_atom.dart';
import 'package:flutter/material.dart';

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
                        Navigator.of(context).pushNamed('/login');
                      },
                      child: const Text('Login'),
                    )
                  : Text(get($currentUser)?.email ?? ''),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/products');
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
