
import 'package:flutter/material.dart';
import 'package:snake_detector/config/constants/app_colors.dart';

class AppTheme {
 static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.lightPrimary,
    dividerColor: Colors.black,
    colorScheme: ColorScheme.light(
      surface: AppColors.lightBackground,
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightSecondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightPrimary,
        foregroundColor: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.lightSecondary,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.darkPrimary,
    dividerColor: Colors.white,
    colorScheme: ColorScheme.dark(
      surface: AppColors.darkBackground,
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkSecondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkPrimary,
        foregroundColor: Colors.black,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.darkSecondary,
      ),
    ),
  );
}