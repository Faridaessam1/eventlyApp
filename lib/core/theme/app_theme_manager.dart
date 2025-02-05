import 'package:evently_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppThemeManager {


  static ThemeData lightData = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: "InterItalic"
      ),
    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryColorLight,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white,
      showSelectedLabels: true
  )
  );

  static ThemeData darkData = ThemeData(
      scaffoldBackgroundColor: AppColors.primaryColorDark,
      textTheme: const TextTheme(
        titleMedium: TextStyle(
            fontFamily: "InterItalic"
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryColorDark,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.white,
        showSelectedLabels: true
      )
  );

}