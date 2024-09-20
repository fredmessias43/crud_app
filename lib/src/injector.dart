import 'package:auto_injector/auto_injector.dart';
import 'package:crud_app/src/modules/auth/auth_cache_repository.dart';
import 'package:crud_app/src/modules/auth/auth_repository.dart';
import 'package:crud_app/src/modules/products/product_repository.dart';

final injector = AutoInjector();

void registerInstances() {
  // repository
  injector.add<ProductRepository>(SharedProductRepository.new);
  injector.add<AuthRepository>(MockAuthRepository.new);
  injector.add<AuthCacheRepository>(SharedAuthCacheRepository.new);
  injector.commit();
}
