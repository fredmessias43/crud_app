import 'package:crud_app/src/products/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  final Function? onNavigateBack;
  const ProductTile({
    Key? key,
    required this.product,
    this.onNavigateBack,
  }) : super(key: key);

  _voidFunction() => {};

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.inventory),
      title: Text(product.name),
      subtitle: Text(product.description),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(
                      "/products/upsert",
                      arguments: product,
                    )
                    .then((value) => onNavigateBack ?? _voidFunction());
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
