import 'package:flutter/material.dart';

abstract class AppColors {
  static final primarySwatch = Colors.orange;
  static final accentColor = Color(0xFFDEAD29);
  static final surfaceColor = Color(0xFF121212);
  static final backgroundColor = Color(0xFFFDFDFD);
  static final inactiveColor = Color(0xFFCECECE);
  static final text = Color(0xFF1C1C1C);
  static final textLight = Color(0xFFEFEFEF);
  static final errorBackground = Color(0xFFD91616);
}

abstract class Typography {
  static const _fontFamilyRaleway = 'Raleway';
  static const _fontFamilyYanoneKaffeesatz = 'Yanone Kaffeesatz';

  static final textTheme = TextTheme(
    headline4: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.normal,
      color: AppColors.text,
      fontFamily: _fontFamilyYanoneKaffeesatz,
    ),
    headline5: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColors.text,
      fontFamily: _fontFamilyYanoneKaffeesatz,
    ),
    headline6: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.text,
      fontFamily: _fontFamilyYanoneKaffeesatz,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.text,
      fontFamily: _fontFamilyRaleway,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.text,
      fontFamily: _fontFamilyRaleway,
    ),
  );
}

final appTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: AppColors.primarySwatch,
  accentColor: AppColors.accentColor,
  scaffoldBackgroundColor: AppColors.surfaceColor,
  backgroundColor: AppColors.backgroundColor,
  disabledColor: AppColors.inactiveColor,
  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColors.errorBackground,
    contentTextStyle: Typography.textTheme.bodyText2?.copyWith(color: AppColors.textLight),
  ),
  inputDecorationTheme: InputDecorationTheme(
    disabledBorder: InputBorder.none,
    border: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.inactiveColor)),
    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.inactiveColor)),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accentColor, width: 2)),
  ),
  textTheme: Typography.textTheme,
);
