import 'package:asp/asp.dart';
import 'package:crud_app/src/modules/products/product_action.dart';
import 'package:crud_app/src/modules/products/product_atom.dart';
import 'package:flutter/material.dart';

class ProductIndexPage extends StatefulWidget {
  const ProductIndexPage({super.key});

  @override
  State<ProductIndexPage> createState() => _ProductIndexPageState();
}

class _ProductIndexPageState extends State<ProductIndexPage> {
  @override
  void initState() {
    getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Products'),
            const SizedBox(width: 36),
            IconButton(
              color: Colors.black,
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/products/new');
              },
            ),
          ],
        ),
      ),
      body: RxBuilder(
        builder: (context) {
          final products = $products.value;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text(product.description),
                onTap: () {
                  getProduct(product.id!);
                  Navigator.pushNamed(
                    context,
                    '/products/edit',
                    arguments: product.id!,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
