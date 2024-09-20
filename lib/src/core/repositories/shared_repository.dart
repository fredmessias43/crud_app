import 'package:shared_preferences/shared_preferences.dart';

mixin SharedRepository {
  Future<void> saveString(String key, String value) async {
    final shared = await SharedPreferences.getInstance();
    shared.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final shared = await SharedPreferences.getInstance();
    return shared.getString(key);
  }
}
