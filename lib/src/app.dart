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
      initialRoute: '/products',
      routes: {
        '/': (context) => const HomePage(),
        '/products': (context) => const ProductIndexPage(),
        '/products/new': (context) => const ProductUpsertPage(),
        '/products/edit': (context) => ProductUpsertPage(
              id: ModalRoute.of(context)!.settings.arguments as String,
            ),
      },
    );
  }
}
