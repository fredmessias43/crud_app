import 'package:crud_app/src/modules/users/user_model.dart';

class AuthResponse {
  final String accessToken;
  final UserModel user;

  AuthResponse({
    required this.user,
    required this.accessToken,
  });

  AuthResponse copyWith({
    UserModel? user,
    String? accessToken,
  }) {
    return AuthResponse(
      user: user ?? this.user,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user,
      'access_token': accessToken,
    };
  }

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      user: UserModel.fromMap(map['user']),
      accessToken: map['access_token'] as String,
    );
  }
}
