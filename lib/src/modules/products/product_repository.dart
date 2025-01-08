import 'dart:convert';

import 'package:crud_app/src/modules/products/product_model.dart';
import 'package:crud_app/src/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProduct(String id);
  Future<ProductModel> createProduct(ProductModel product);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
}

class SharedProductRepository implements ProductRepository {
  static const key = "products_list";

  @override
  Future<List<ProductModel>> getProducts() async {
    return await _get();
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    var list = await _get();
    return list.firstWhere((element) => element.id == id);
  }

  @override
  Future<ProductModel> createProduct(ProductModel product) async {
    var list = await _get();
    final newProduct = product.copyWith(id: list.length.toString());
    list = upsertArray(list, newProduct);
    await _save(list);
    return newProduct;
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    var list = await _get();
    final newProduct = product.copyWith();
    list = upsertArray(list, newProduct);
    await _save(list);
    return newProduct;
  }

  @override
  Future<void> deleteProduct(String id) async {
    var list = await _get();
    list = removeArray(list, id);
    await _save(list);
  }

  Future<List<ProductModel>> _get() async {
    await Future.delayed(const Duration(seconds: 1));
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString(key) ?? '[]';
    final list = jsonDecode(json) as List;
    return list.map((e) => ProductModel.fromMap(jsonDecode(e))).toList();
  }

  Future<void> _save(List<ProductModel> list) async {
    final shared = await SharedPreferences.getInstance();
    final json = jsonEncode(list);
    shared.setString(key, json);
  }
}
