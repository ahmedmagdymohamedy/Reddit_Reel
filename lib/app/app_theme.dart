import 'package:flutter/material.dart';
import 'package:reddit_task/core/resources/app_colors.dart';
import 'package:reddit_task/core/resources/app_fonts.dart';

/// the general theme of the application;

ThemeData getAppTheme(BuildContext context) {
  return ThemeData(
    // colors
    primaryColor: AppColors.primary,
    secondaryHeaderColor: AppColors.primary,
    disabledColor: AppColors.lightGrey,
    scaffoldBackgroundColor: AppColors.scaffold,
    splashColor: AppColors.primary.withOpacity(0.2),
    highlightColor: AppColors.primary.withOpacity(0.1),
    // app bar
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      foregroundColor: AppColors.primary,
      titleTextStyle: TextStyle(
        color: AppColors.head,
        fontSize: 20,
        fontFamily: AppFonts.getLato(),
        fontWeight: FontWeight.w600,
      ),
    ),

    // elevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: AppFonts.getLato(),
          ),
        ),
      ),
    ),

    // cursor color
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
    ),

    // Text Theme
    textTheme: Theme.of(context).textTheme.apply(
          bodyColor: AppColors.body,
          fontFamily: AppFonts.getLato(),
        ),

    // input theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      filled: true,
      fillColor: AppColors.lightGrey,
      labelStyle: const TextStyle(
        fontSize: 16,
      ),
      hintStyle: const TextStyle(
        color: AppColors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      errorStyle: const TextStyle(
        color: Colors.red,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent, width: 1),
        borderRadius: BorderRadius.circular(6),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary, width: 1),
        borderRadius: BorderRadius.circular(6),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(6),
      ),
      suffixIconColor: AppColors.grey,
      prefixIconColor: AppColors.grey,
    ),

    // icons
    iconTheme: const IconThemeData(
      color: AppColors.body,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 1,
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      selectedLabelStyle: TextStyle(
        fontSize: 12,
      ),
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.lightGrey,
      showUnselectedLabels: true,
    ),

    //
  );
}
