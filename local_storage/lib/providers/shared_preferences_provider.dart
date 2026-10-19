import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Provider chính để cung cấp "instance" SharedPreferences (LS) cho cả app

part 'shared_preferences_provider.g.dart';

@riverpod
SharedPreferences sharedPreferences(Ref ref) {
  // Chủ động throw 1 exception
  // vì provider này sẽ được set lại value (override lại state) lúc run dự án (main)
  throw UnimplementedError();
}
