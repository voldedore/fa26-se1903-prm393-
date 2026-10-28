import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_intro/services/auth_service.dart';
import 'package:jwt_intro/services/token_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

// token provider
final tokenServiceProvider = Provider<TokenService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return TokenService(prefs);
});
// auth provider
final authServiceProvider = Provider<AuthService>((ref) {
  final tokenService = ref.watch(tokenServiceProvider);
  return AuthService(tokenService);
});