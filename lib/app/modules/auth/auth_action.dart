import 'package:asp/asp.dart';
import 'package:crud_app/app/injector.dart';
import 'package:crud_app/app/modules/auth/auth_atom.dart';
import 'package:crud_app/app/modules/auth/auth_cache_repository.dart';
import 'package:crud_app/app/modules/auth/auth_model.dart';
import 'package:crud_app/app/modules/auth/auth_repository.dart';

final login = atomAction2((set, String email, String password) async {
  set($isLoading, true);
  final repository = injector.get<AuthRepository>();

  try {
    final response = await repository.login(email, password);
    print(response.accessToken);
    await setUser(response);
  } catch (e) {
    set($errorMessage, e.toString());
  } finally {
    set($isLoading, false);
  }
});

final logout = atomAction((set) async {
  await removeUser();
});

final removeUser = atomAction((set) async {
  final repository = injector.get<AuthCacheRepository>();

  // await repository.clear();

  set($accessToken, null);
  set($currentUser, null);
  set($isLogged, false);
});

final setUser = atomAction1((set, AuthResponse response) async {
  final repository = injector.get<AuthCacheRepository>();

  await repository.saveAccessToken(response.accessToken);
  await repository.saveUserId(response.user.id);

  set($accessToken, response.accessToken);
  set($currentUser, response.user.copyWith());
  set($isLogged, true);
});

final getSessionUser = atomAction((set) async {
  set($isLoading, true);

  final cacheRepository = injector.get<AuthCacheRepository>();
  final httpRepository = injector.get<AuthRepository>();

  final accessToken = await cacheRepository.getAccessToken();
  final userId = await cacheRepository.getUserId();

  if (accessToken != null && userId != null) {
    try {
      final sessionUser = await httpRepository.getSessionUser();

      set($accessToken, accessToken);
      set($isLogged, true);
      set($currentUser, sessionUser.copyWith());
    } catch (e) {
      set($errorMessage, e.toString());
    }
  }
  set($isLoading, true);
});
