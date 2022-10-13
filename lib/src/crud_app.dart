import 'package:crud_app/src/products/pages/product_index_page.dart';
import 'package:crud_app/src/products/pages/product_upsert_page.dart';
import 'package:crud_app/src/products/services/product_service.dart';
import 'package:crud_app/src/products/stores/product_store.dart';
import 'package:crud_app/src/tasks/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uno/uno.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => Uno(baseURL: 'http://localhost:3000'),
        ),
        Provider(
          create: (context) => ProductService(context.read<Uno>()),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductStore(context.read<ProductService>()),
        ),
        ChangeNotifierProvider(
          create: (_) => TaskProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Crud App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const HomePage(),
        routes: {
          "/": (_) => const ProductIndexPage(),
          "/products/upsert": (_) => const ProductUpsertPage()
        },
      ),
    );
  }
}
