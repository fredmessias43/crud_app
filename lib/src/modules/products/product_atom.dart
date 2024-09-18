import 'package:asp/asp.dart';
import 'package:crud_app/src/modules/products/product_model.dart';

final $products = Atom<List<ProductModel>>([]);
final $currentProduct = Atom<ProductModel?>(null);
final $productError = Atom<String?>(null);
final $productLoading = Atom<bool>(false);
