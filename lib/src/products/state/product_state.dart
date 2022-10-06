import 'package:crud_app/src/products/models/product_model.dart';

abstract class ProductState {}

class InitialProductState extends ProductState {}

class SuccessProductState extends ProductState {
  final List<ProductModel> products;

  get product => products[0];

  SuccessProductState(this.products);
}

class LoadingProductState extends ProductState {}

class ErrorProductState extends ProductState {
  final String message;

  ErrorProductState(this.message);
}
