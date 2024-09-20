import 'package:asp/asp.dart';
import 'package:crud_app/src/modules/users/user_model.dart';

enum AuthState {
  initial,
  loading,
  error,
}

final $currentUser = atom<UserModel?>(null);
final $accessToken = atom<String?>(null);
final $isLogged = atom<bool>(false);
final $isLoading = atom<bool>(false);
final $errorMessage = atom<String?>(null);

final $state = atom<AuthState>(AuthState.initial);
