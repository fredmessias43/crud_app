import 'dart:convert';

import 'package:crud_app/src/core/repositories/shared_repository.dart';

abstract class AuthCacheRepository {
  Future<void> saveAccessToken(String accessToken);
  Future<String?> getAccessToken();

  Future<void> saveUserId(String userId);
  Future<String?> getUserId();
}

class SharedAuthCacheRepository
    with SharedRepository
    implements AuthCacheRepository {
  static const key = "auth_data";

  @override
  Future<void> saveAccessToken(String accessToken) async {
    await Future.delayed(const Duration(seconds: 1));

    final str = await getString(key) ?? '{}';
    final json = jsonDecode(str);
    json['access_token'] = accessToken;
    await saveString(key, jsonEncode(json));
  }

  @override
  Future<String?> getAccessToken() async {
    await Future.delayed(const Duration(seconds: 1));
    final str = await getString(key) ?? '{}';
    final json = jsonDecode(str);
    return json['access_token'];
  }

  @override
  Future<void> saveUserId(String userId) async {
    await Future.delayed(const Duration(seconds: 1));

    final str = await getString(key) ?? '{}';
    final json = jsonDecode(str);
    json['user_id'] = userId;
    await saveString(key, jsonEncode(json));
  }

  @override
  Future<String?> getUserId() async {
    await Future.delayed(const Duration(seconds: 1));
    final str = await getString(key) ?? '{}';
    final json = jsonDecode(str);
    return json['user_id'];
  }
}
