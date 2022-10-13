import 'package:crud_app/src/products/components/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:crud_app/src/products/state/product_state.dart';
import 'package:crud_app/src/products/stores/product_store.dart';

class ProductIndexPage extends StatefulWidget {
  const ProductIndexPage({Key? key}) : super(key: key);

  @override
  State<ProductIndexPage> createState() => _ProductIndexPageState();
}

class _ProductIndexPageState extends State<ProductIndexPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductStore>().index();
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<ProductStore>();
    final state = store.value;

    Widget? child;
    Widget? floatingActionButton;

    if (state is LoadingProductState) {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is ErrorProductState) {
      child = Center(
        child: Text("Error: " + state.message),
      );
    }
    if (state is SuccessProductState) {
      child = SizedBox(
        child: ListView.builder(
          itemCount: state.products.length,
          itemBuilder: (_, index) {
            final product = state.products[index];
            return ProductTile(product: product);
          },
        ),
      );
      // floatingActionButton = ;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Page'),
      ),
      body: child ?? Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/products/upsert");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
