import 'package:crud_app/src/pages/auth/login_page.dart';
import 'package:crud_app/src/pages/home_page.dart';
import 'package:crud_app/src/pages/products/product_index_page.dart';
import 'package:crud_app/src/pages/products/product_upsert_page.dart';
import 'package:flutter/material.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Crud App",
      initialRoute: '/login',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => LoginPage(),
        '/products': (context) => const ProductIndexPage(),
        '/products/new': (context) => ProductUpsertPage(),
        '/products/edit': (context) => ProductUpsertPage(
              id: ModalRoute.of(context)!.settings.arguments as String,
            ),
      },
    );
  }
}
