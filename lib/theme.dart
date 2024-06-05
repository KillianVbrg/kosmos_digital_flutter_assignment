import 'package:assignment/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData primaryTheme = ThemeData(
  // seed
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),

  appBarTheme: AppBarTheme(
    surfaceTintColor: Colors.transparent,
  ),


  textTheme: TextTheme(
    bodySmall: TextStyle(
      color: AppColors.textMuted,
      fontSize: 12,
    ),
    bodyMedium: TextStyle(
      color: AppColors.primaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w600
    ),
    headlineSmall: TextStyle(
      color: AppColors.textMuted,
      fontSize: 16,
    ),
    headlineMedium: TextStyle(
      color: AppColors.primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: TextStyle(
      color: AppColors.primaryColor,
      fontSize: 21,
      fontWeight: FontWeight.w900,
    ),
    displayLarge: TextStyle(
      color: AppColors.primaryColor,
      fontSize: 34,
      fontWeight: FontWeight.w900,
    ),
    titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w400
    ),
    titleLarge: TextStyle(
      color: AppColors.primaryColor,
      fontSize: 26,
    ),
  ),


  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[200],
    enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(7),
    borderSide: BorderSide(color: Colors.transparent)),
    contentPadding: EdgeInsets.all(15),
    suffixIconColor: Colors.grey,
  ),


  dialogTheme: DialogTheme(
    surfaceTintColor: Colors.transparent
  ),
);