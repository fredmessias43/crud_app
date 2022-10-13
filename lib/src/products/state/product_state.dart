import 'package:crud_app/src/products/models/product_model.dart';

abstract class ProductState {}

class InitialProductState extends ProductState {}

class SuccessProductState extends ProductState {
  final List<ProductModel> products;

  ProductModel? product;

  SuccessProductState(this.products, {this.product});
}

class LoadingProductState extends ProductState {}

class LoadingIndexProductState extends LoadingProductState {}

class LoadingShowProductState extends LoadingProductState {}

class LoadingStoreProductState extends LoadingProductState {}

class LoadingUpdateProductState extends LoadingProductState {}

class LoadingDeleteProductState extends LoadingProductState {}

class ErrorProductState extends ProductState {
  final String message;

  ErrorProductState(this.message);
}
