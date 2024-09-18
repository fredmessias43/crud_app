import 'package:auto_injector/auto_injector.dart';
import 'package:crud_app/src/modules/products/product_repository.dart';

final injector = AutoInjector();

void registerInstances() {
  // repository
  injector.add<ProductRepository>(SharedProductRepository.new);
  injector.commit();
}
