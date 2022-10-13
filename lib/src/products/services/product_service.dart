import 'package:crud_app/src/products/models/product_model.dart';
import 'package:uno/uno.dart';

class ProductService {
  final Uno uno;

  ProductService(this.uno);

  Future<List<ProductModel>> index() async {
    final res = await uno.get('/products');
    final list = res.data as List;
    final products = list.map((e) => ProductModel.fromMap(e)).toList();
    return products;
  }

  Future<ProductModel> show(String id) async {
    final res = await uno.get('/products/' + id);
    final json = res.data as Map<String, dynamic>;
    final product = ProductModel.fromMap(json);
    return product;
  }

  Future<ProductModel> store(Map<String, dynamic> data) async {
    final res = await uno.post(
      '/products',
      headers: {'content-type': 'application/json; charset=UTF-8'},
      data: data,
    );
    final json = res.data as Map<String, dynamic>;
    final product = ProductModel.fromMap(json);
    return product;
  }

  Future<ProductModel> update(Map<String, dynamic> data, String id) async {
    final res = await uno.put(
      '/products/' + id,
      headers: {'content-type': 'application/json; charset=UTF-8'},
      data: data,
    );
    final json = res.data as Map<String, dynamic>;
    final product = ProductModel.fromMap(json);
    return product;
  }

  Future<ProductModel> delete(String id) async {
    final res = await uno.delete('/product/' + id);
    final json = res.data as Map<String, dynamic>;
    final product = ProductModel.fromMap(json);
    return product;
  }
}
