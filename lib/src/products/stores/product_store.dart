import 'package:crud_app/src/products/services/product_service.dart';
import 'package:crud_app/src/products/state/product_state.dart';
import 'package:flutter/material.dart';

class ProductStore extends ValueNotifier<ProductState> {
  final ProductService service;

  ProductStore(this.service) : super(InitialProductState());

  Future all() async {
    value = LoadingProductState();
    // await Future.delayed(const Duration(seconds: 1));
    try {
      final products = await service.all();
      value = SuccessProductState(products);
    } catch (e) {
      value = ErrorProductState(e.toString());
    }
  }
}
