import 'package:flutter/material.dart';

class AppTheme {
  // Instagram-style gradient colors
  static const Color gradientStart   = Color(0xFF833AB4); // Deep Purple
  static const Color gradientMid1    = Color(0xFFC13584); // Magenta Pink
  static const Color gradientMid2    = Color(0xFFE1306C); // Hot Pink
  static const Color gradientMid3    = Color(0xFFF56040); // Orange Red
  static const Color gradientEnd     = Color(0xFFFCAF45); // Golden Orange

  static const LinearGradient instagramGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      gradientStart,
      gradientMid1,
      gradientMid2,
      gradientMid3,
      gradientEnd,
    ],
    stops: [0.0, 0.25, 0.5, 0.75, 1.0],
  );

  // Softer card gradient (purple → pink only)
  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF833AB4), Color(0xFFC13584)],
  );

  // Warm card gradient (pink → orange)
  static const LinearGradient cardGradientWarm = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFE1306C), Color(0xFFFCAF45)],
  );

  static ThemeData get theme {
    return ThemeData(
      fontFamily: 'Roboto',
      colorScheme: ColorScheme.fromSeed(
        seedColor: gradientMid1,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
    );
  }
}