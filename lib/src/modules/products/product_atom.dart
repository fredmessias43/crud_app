import 'package:asp/asp.dart';
import 'package:crud_app/src/modules/products/product_model.dart';

final $products = atom<List<ProductModel>>([]);
final $currentProduct = atom<ProductModel?>(null);
final $productError = atom<String?>(null);
final $productLoading = atom<bool>(false);
