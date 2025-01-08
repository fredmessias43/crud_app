import 'package:asp/asp.dart';
import 'package:crud_app/src/core/router/route_config.dart';
import 'package:crud_app/src/core/router/route_data.dart';
import 'package:crud_app/src/core/widgets/app_scaffold.dart';
import 'package:crud_app/src/modules/auth/auth_action.dart';
import 'package:crud_app/src/modules/auth/auth_atom.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>(debugLabel: 'login');

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AtomBuilder(
      builder: (context, get) {
        return AppScaffold(
          child: Column(
            children: [
              Form(
                key: _form,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await login(
                          emailController.text,
                          passwordController.text,
                        );
                        if (get($isLogged)) {
                          RouteConfig.push(RoutePath.inicio.name);
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
              if (get($isLoading)) const CircularProgressIndicator(),
              if (get($errorMessage) != null) Text(get($errorMessage) ?? ''),
            ],
          ),
        );
      },
    );
  }
}
