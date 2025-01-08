import 'package:asp/asp.dart';
import 'package:crud_app/src/core/router/route_config.dart';
import 'package:crud_app/src/core/router/route_data.dart';
import 'package:crud_app/src/core/widgets/app_scaffold.dart';
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
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AtomBuilder(builder: (context, get) {
      final products = get($products);

      return AppScaffold(
        title: Row(
          children: [
            const Text('Products'),
            const SizedBox(width: 36),
            IconButton(
              color: Colors.black,
              icon: const Icon(Icons.add),
              onPressed: () {
                RouteConfig.push(RoutePath.productsCreate.name);
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
                          RouteConfig.push(
                            RoutePath.productsEdit.name,
                            pathParameters: {"productId": product.id!},
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
