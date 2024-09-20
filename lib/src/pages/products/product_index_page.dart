import 'package:asp/asp.dart';
import 'package:crud_app/src/core/widgets/crud_app_scaffold.dart';
import 'package:crud_app/src/modules/products/product_action.dart';
import 'package:crud_app/src/modules/products/product_atom.dart';
import 'package:flutter/material.dart';

class ProductIndexPage extends StatelessWidget {
  const ProductIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    getAllProducts();

    return AtomBuilder(builder: (context, get) {
      final products = get($products);

      return CrudAppScaffold(
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
        child: AtomBuilder(
          builder: (context, state) {
            final loading = get($productLoading);

            return loading
                ? const CircularProgressIndicator()
                : ListView.builder(
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
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            deleteProduct(product.id!);
                          },
                        ),
                      );
                    },
                  );
          },
        ),
      );
    });
  }
}
