import 'package:crud_app/src/products/models/product_model.dart';
import 'package:crud_app/src/products/services/product_service.dart';
import 'package:crud_app/src/products/state/product_state.dart';
import 'package:flutter/material.dart';

class ProductStore extends ValueNotifier<ProductState> {
  final ProductService service;

  late List<ProductModel> _cachedProducts;

  ProductStore(this.service) : super(InitialProductState());

  Future index() async {
    value = LoadingIndexProductState();
    // await Future.delayed(const Duration(seconds: 1));
    try {
      final products = await service.index();
      _cachedProducts = products;
      value = SuccessProductState(_cachedProducts);
    } catch (e) {
      value = ErrorProductState(e.toString());
    }
  }

  Future show(String id) async {
    value = LoadingShowProductState();
    await Future.delayed(const Duration(seconds: 1));
    try {
      final product = await service.show(id);
      final idx =
          _cachedProducts.indexWhere((element) => element.id == product.id);
      _cachedProducts[idx] = product;
      value = SuccessProductState(_cachedProducts, product: product);
    } catch (e) {
      value = ErrorProductState(e.toString());
    }
  }

  Future store(Map<String, dynamic> data) async {
    value = LoadingStoreProductState();
    await Future.delayed(const Duration(seconds: 1));
    try {
      final product = await service.store(data);
      _cachedProducts.add(product);
      value = SuccessProductState(_cachedProducts);
    } catch (e) {
      value = ErrorProductState(e.toString());
    }
  }

  Future update(Map<String, dynamic> data, String id) async {
    value = LoadingUpdateProductState();
    await Future.delayed(const Duration(seconds: 1));
    try {
      final product = await service.update(data, id);
      final idx =
          _cachedProducts.indexWhere((element) => element.id == product.id);
      _cachedProducts[idx] = product;
      value = SuccessProductState(_cachedProducts);
    } catch (e) {
      value = ErrorProductState(e.toString());
    }
  }

  Future upsert(Map<String, dynamic> data) async {
    if (data.containsKey('id')) {
      await update(data, data['id']);
    } else {
      await store(data);
    }
  }

  Future delete(String id) async {
    value = LoadingDeleteProductState();
    // await Future.delayed(const Duration(seconds: 1));
    try {
      final product = await service.delete(id);
      _cachedProducts.removeWhere((element) => element.id == product.id);
      value = SuccessProductState(_cachedProducts);
    } catch (e) {
      value = ErrorProductState(e.toString());
    }
  }
}
