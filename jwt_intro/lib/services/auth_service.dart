import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_intro/services/token_service.dart';
import '../model/user.dart';

class AuthService {
  // login (call API -> token service de save token)
  final TokenService tokenService;
  AuthService(this.tokenService);
  Future<User> login(String username, String password) async {
    final response = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        headers: {
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          'username': username,
          'password': password
        })
    );
    if (response.statusCode == 200) {
      final loggedInUser = User.fromJson(jsonDecode(response.body));
      await tokenService.saveToken(loggedInUser);
      return loggedInUser;
    } else {
      throw Exception('Login failed');
    }
  }

// logout
}