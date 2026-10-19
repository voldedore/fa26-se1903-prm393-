// Class nay nhu 1 class helper, tao ra ThemeData cho ca app
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData create(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Color(0xB3CA1818), // theo hex color
      brightness: brightness,
    );
    final base = ThemeData(useMaterial3: true, colorScheme: colorScheme);

    return base.copyWith(
      // copyWith = lấy base và sao chép các theme, sau đó custom riêng
      textTheme: base.textTheme.copyWith(
        titleLarge: base.textTheme.titleLarge?.copyWith(fontWeight: .bold),
        bodyMedium: base.textTheme.bodyMedium?.copyWith(
          height: 1.2,
          fontWeight: .w100,
          fontSize: 24
        ),
      ),
      // Tao moi ThemeData cho rieng FilledBtn
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: .circular(12)),
        ),
      ),
      appBarTheme: AppBarTheme(backgroundColor: colorScheme.inversePrimary),
    );
  }
}
