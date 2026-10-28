import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class TokenService {
  // Thuoc tinh cua lop (instance cuar shared prefs)
  final SharedPreferences prefs;

  TokenService(this.prefs);

  Future<void> saveToken(User user) async {
    await prefs.setInt('userId', user.id);
    await prefs.setString('username', user.username);
    await prefs.setString('accessToken', user.accessToken);
    await prefs.setString('refreshToken', user.refreshToken);
    await prefs.setString('email', user.email);
  }

  Future<User?> getToken() async {
    final id = prefs.getInt('userId');
    final username = prefs.getString('username');
    final accessToken = prefs.getString('accessToken');
    final refreshToken = prefs.getString('refreshToken');
    final email = prefs.getString('email');

    if (accessToken != null && refreshToken != null) {
      return User(
        id: id ?? 0,
        username: username!,
        email: email!,
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
    }
    return null;
  }
}
