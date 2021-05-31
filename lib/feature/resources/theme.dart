import 'package:flutter/material.dart';

abstract class AppColors {
  static final primarySwatch = Colors.orange;
  static final accentColor = Color(0xFFDEAD29);
  static final surfaceColor = Color(0xFF121212);
  static final backgroundColor = Color(0xFFEAEAEA);
  static final inactiveColor = Color(0xFFCECECE);
}

final appTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: AppColors.primarySwatch,
  accentColor: AppColors.accentColor,
  scaffoldBackgroundColor: AppColors.surfaceColor,
  backgroundColor: AppColors.backgroundColor,
  inputDecorationTheme: InputDecorationTheme(
    disabledBorder: InputBorder.none,
    border: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.inactiveColor)),
    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.inactiveColor)),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accentColor, width: 2)),
  ),
);
