import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFF6B00);
  static const Color primaryLight = Color(0xFFFF8533);
  static const Color primaryDark = Color(0xFFE55A00);
  static const Color secondary = Color(0xFFFFD700);
  static const Color accent = Color(0xFF4CAF50);
  static const Color background = Color(0xFFF5F5F5);
  static const Color cardBg = Colors.white;
  static const Color darkBg = Color(0xFF1A1A2E);
  static const Color textPrimary = Color(0xFF2D3436);
  static const Color textSecondary = Color(0xFF636E72);
  static const Color textLight = Colors.white;
  static const Color success = Color(0xFF00B894);
  static const Color error = Color(0xFFFF4757);
  static const Color warning = Color(0xFFFFA502);
  
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient darkGradient = LinearGradient(
    colors: [darkBg, Color(0xFF16213E)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
