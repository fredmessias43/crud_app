import 'package:crud_app/src/products/models/product_model.dart';
import 'package:uno/uno.dart';

class ProductService {
  final Uno uno;

  ProductService(this.uno);

  Future<List<ProductModel>> all() async {
    final response = await uno.get('/products');
    final list = response.data as List;
    final products = list.map((e) => ProductModel.fromMap(e)).toList();
    return products;
  }

  Future<ProductModel> show(String id) async {
    final response = await uno.get('/product/' + id);
    final json = response.data as Map<String, dynamic>;
    final product = ProductModel.fromMap(json);
    return product;
  }

  Future<ProductModel> store(Map<String, dynamic> data) async {
    final response = await uno.post('/product', data: data);
    final json = response.data as Map<String, dynamic>;
    final product = ProductModel.fromMap(json);
    return product;
  }

  Future<ProductModel> update(Map<String, dynamic> data, String id) async {
    final response = await uno.put('/product/' + id, data: data);
    final json = response.data as Map<String, dynamic>;
    final product = ProductModel.fromMap(json);
    return product;
  }

  Future<ProductModel> delete(String id) async {
    final response = await uno.delete('/product/' + id);
    final json = response.data as Map<String, dynamic>;
    final product = ProductModel.fromMap(json);
    return product;
  }
}
