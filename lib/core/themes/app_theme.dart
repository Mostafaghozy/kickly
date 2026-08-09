import 'package:flutter/material.dart';
import 'package:kickly/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightBackground,
        foregroundColor: AppColors.lightText,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: AppColors.lightCard,
        elevation: 2,
        margin: EdgeInsets.zero,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.lightText),
        bodyMedium: TextStyle(color: AppColors.lightText),
        bodySmall: TextStyle(color: AppColors.lightText),
        titleMedium: TextStyle(color: AppColors.lightText),
        titleLarge: TextStyle(color: AppColors.lightText),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      primaryColor: AppColors.primaryDark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryDark,
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.darkText,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkCard,
        elevation: 2,
        margin: EdgeInsets.zero,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.darkText),
        bodyMedium: TextStyle(color: AppColors.darkText),
        bodySmall: TextStyle(color: AppColors.darkText),
        titleMedium: TextStyle(color: AppColors.darkText),
        titleLarge: TextStyle(color: AppColors.darkText),
      ),
    );
  }
}
