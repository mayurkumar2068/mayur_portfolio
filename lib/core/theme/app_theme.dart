import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_constants.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(AppConstants.primaryColorValue),
      scaffoldBackgroundColor: const Color(AppConstants.backgroundColorValue),
      cardColor: const Color(AppConstants.cardColorValue),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).apply(
        bodyColor: const Color(AppConstants.textColorValue),
        displayColor: const Color(AppConstants.headingColorValue),
      ),
    );
  }
}
