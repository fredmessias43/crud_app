import 'package:asp/asp.dart';
import 'package:crud_app/src/injector.dart';
import 'package:crud_app/src/modules/products/product_atom.dart';
import 'package:crud_app/src/modules/products/product_model.dart';
import 'package:crud_app/src/modules/products/product_repository.dart';
import 'package:crud_app/src/utils.dart';

final getAllProducts = atomAction((set) async {
  set($productLoading, true);
  final repository = injector.get<ProductRepository>();
  set($products, await repository.getProducts());
  set($productLoading, false);
});

final getProduct = atomAction1((set, String id) async {
  set($productLoading, true);
  final repository = injector.get<ProductRepository>();

  set($currentProduct, await repository.getProduct(id));
  set($productLoading, false);
});

final upsertProduct = atomAction1((set, ProductModel product) async {
  set($productLoading, true);
  final repository = injector.get<ProductRepository>();

  final newProduct = product.id == null
      ? await repository.createProduct(product)
      : await repository.updateProduct(product);

  set($products, upsertArray($products.state, newProduct));
  set($productLoading, false);
});

final deleteProduct = atomAction1((set, String id) async {
  set($productLoading, true);

  final repository = injector.get<ProductRepository>();

  await repository.deleteProduct(id);

  set($products, removeArray($products.state, id));
  set($productLoading, false);
});

final clearProductError = atomAction((set) {
  set($productError, null);
});

final clearCurrentProduct = atomAction((set) {
  set($currentProduct, null);
});
