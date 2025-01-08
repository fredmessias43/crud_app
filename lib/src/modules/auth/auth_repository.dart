import 'package:crud_app/src/modules/auth/auth_model.dart';
import 'package:crud_app/src/modules/users/user_model.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(String email, String password);
  // Future<RegisterResponse> register(String email, String password);
  // Future<void> logout();

  Future<UserModel> getSessionUser();
}

class MockAuthRepository implements AuthRepository {
  static const key = "auth_data";

  @override
  Future<AuthResponse> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return AuthResponse.fromMap({
      'access_token': '123456',
      'user': {
        'id': '1',
        'name': 'John Doe',
        'email': email,
      },
    });
  }

  @override
  Future<UserModel> getSessionUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(id: '1', name: 'John Doe', email: 'john.doe@email.com');
  }
}
