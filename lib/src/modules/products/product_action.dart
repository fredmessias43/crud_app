import 'package:crud_app/src/injector.dart';
import 'package:crud_app/src/modules/products/product_atom.dart';
import 'package:crud_app/src/modules/products/product_model.dart';
import 'package:crud_app/src/modules/products/product_repository.dart';
import 'package:crud_app/src/utils.dart';

Future<void> getAllProducts() async {
  $productLoading.value = true;
  final repository = injector.get<ProductRepository>();

  $products.value = await repository.getProducts();
  $productLoading.value = false;
}

Future<void> getProduct(String id) async {
  $productLoading.value = true;
  final repository = injector.get<ProductRepository>();

  $currentProduct.value = await repository.getProduct(id);
  $productLoading.value = false;
}

Future<void> upsertProduct(ProductModel product) async {
  $productLoading.value = true;
  final repository = injector.get<ProductRepository>();

  final newProduct = product.id == null
      ? await repository.createProduct(product)
      : await repository.updateProduct(product);

  $products.value = upsertArray($products.value, newProduct);
  $productLoading.value = false;
}

Future<void> deleteProduct(String id) async {
  $productLoading.value = true;

  final repository = injector.get<ProductRepository>();

  await repository.deleteProduct(id);

  $products.value = removeArray($products.value, id);
  $productLoading.value = false;
}
