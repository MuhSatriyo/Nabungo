import 'package:flutter/material.dart';

class AppColors {
  // Primary
  static const Color primary = Color(0xFF1B2A4A); // Navy
  static const Color primaryLight = Color(0xFF2C3E6B);
  static const Color primaryDark = Color(0xFF0F1A30);

  // Secondary / Accent
  static const Color accent = Color(0xFF2ED573); // Emerald
  static const Color accentLight = Color(0xFF5BE08B);
  static const Color accentDark = Color(0xFF1EAE5B);

  // Background
  static const Color backgroundLight = Color(0xFFF8F9FC);
  static const Color backgroundDark = Color(0xFF0D1117);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF161B22);

  // Card
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1C2333);

  // Text
  static const Color textPrimary = Color(0xFF1A1D2E);
  static const Color textSecondary = Color(0xFF8E95A9);
  static const Color textHint = Color(0xFFB0B7C3);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Status
  static const Color success = Color(0xFF2ED573);
  static const Color warning = Color(0xFFFFA502);
  static const Color danger = Color(0xFFFF6B6B);
  static const Color info = Color(0xFF54A0FF);

  // Category Colors
  static const Map<String, Color> categoryColors = {
    'Makan': Color(0xFFFF6B6B),
    'Jajan': Color(0xFFFFA502),
    'Transport': Color(0xFF2ED573),
    'Nongkrong': Color(0xFFA29BFE),
    'Top Up': Color(0xFFFD79A8),
    'Belanja': Color(0xFFFDCB6E),
    'Tagihan': Color(0xFFE17055),
    'Kesehatan': Color(0xFF00CEC9),
    'Pendidikan': Color(0xFF6C5CE7),
    'Hiburan': Color(0xFFFD79A8),
    'Gaji': Color(0xFF00B894),
    'Freelance': Color(0xFF0984E3),
    'Investasi': Color(0xFF6C5CE7),
    'Lainnya': Color(0xFF636E72),
  };

  // Gradient
  static const List<Color> primaryGradient = [
    Color(0xFF1B2A4A),
    Color(0xFF2C3E6B),
  ];

  static const List<Color> accentGradient = [
    Color(0xFF2ED573),
    Color(0xFF5BE08B),
  ];

  static const List<Color> cardGradient = [
    Color(0xFF1B2A4A),
    Color(0xFF2C3E6B),
  ];

  // Shadows
  static List<BoxShadow> softShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 20,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.06),
      blurRadius: 15,
      offset: const Offset(0, 2),
    ),
  ];
}
