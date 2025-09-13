import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dark() {
    const bg = Color(0xFF0A0A0A);
    const surface = Color(0xFF2B2B2B);
    const accent = Color(0xFF00B7FF);
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme.fromSeed(seedColor: accent, brightness: Brightness.dark),
      appBarTheme: const AppBarTheme(backgroundColor: bg, centerTitle: true),
      cardTheme: const CardThemeData(color: surface, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16)))),
    );
  }
}
