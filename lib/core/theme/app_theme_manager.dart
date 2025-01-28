import 'package:evently_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppThemeManager {
  static ThemeData lightData = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: "InterItalic"
      ),
    )
  );
}