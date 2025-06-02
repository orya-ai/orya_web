import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final Color _primaryBackgroundColor = const Color(0xFFEBE8E5);
  static final Color _primaryTextColor = Colors.black; // Adjust if needed for contrast
  static final Color _accentColor = Colors.black; // Example, can be your brand's accent

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: _primaryBackgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _accentColor, // Seed color for generating scheme
        background: _primaryBackgroundColor, // Main background
        primary: _accentColor, // Primary interactive elements
        onBackground: _primaryTextColor, // Text/icons on background
        onPrimary: Colors.white, // Text/icons on primary color elements
        // You can define other colors like secondary, error, surface etc.
      ),
      textTheme: GoogleFonts.interTextTheme(
        // Base text theme for good contrast, can be further customized
        ThemeData.light().textTheme.apply(bodyColor: _primaryTextColor, displayColor: _primaryTextColor),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _primaryBackgroundColor,
        elevation: 0, // Flat app bars
        iconTheme: IconThemeData(color: _primaryTextColor),
        titleTextStyle: GoogleFonts.inter(
          color: _primaryTextColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      // Define other component themes as needed (buttons, cards, etc.)
    );
  }

  // Optionally, define a darkTheme here in the future
  // static ThemeData get darkTheme { ... }
}
