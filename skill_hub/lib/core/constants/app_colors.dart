import 'package:flutter/material.dart';

class AppColors {
  static const Color blue = Color(0xFF2575FC);
  static const Color purple = Color(0xFF6A11CB);
  static const Color softCyan = Color(0xFF0EA5E9);
  static const Color mint = Color(0xFF06D6A0);
  static const Color orange = Color(0xFFFFB86B);
  static const Color pink = Color(0xFFFF6B6B);
  static const Color bgDark = Color(0xFF0F1724);
  static const Color white = Color(0xFFFFFFFF);

  static final Gradient splashGradient = LinearGradient(
    colors: [purple, blue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final Gradient bannerGradient = LinearGradient(
    colors: [softCyan, purple],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static final Gradient navGradientDark = LinearGradient(
    colors: [purple, blue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final List<Gradient> cardGradients = [
    LinearGradient(colors: [Color(0xFF2575FC), Color(0xFF6A11CB)]),
    LinearGradient(colors: [Color(0xFF06B6D4), Color(0xFF4ADE80)]),
    LinearGradient(colors: [Color(0xFFFFB86B), Color(0xFFFF6B6B)]),
    LinearGradient(colors: [Color(0xFF8B5CF6), Color(0xFF06B6D4)]),
    LinearGradient(colors: [Color(0xFF00C9FF), Color(0xFF92FE9D)]),
    LinearGradient(colors: [Color(0xFFFF7A7A), Color(0xFF8E2DE2)]),
    LinearGradient(colors: [Color(0xFF00c6ff), Color(0xFF0072ff)]),
    LinearGradient(colors: [Color(0xFFf7971e), Color(0xFFffd200)]),
  ];
}
