import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static const Color morningPrimary = Color(0xFFFDF7E7);
  static const Color defaultPrimary = Color(0xFFE8D9D5);
  static const Color eveningPrimary = Color(0xFFD3C9DA);

  static const Color morningAccent = Color(0xFFFFCC59);
  static const Color defaultAccent = Color(0xFFE0ACA3);
  static const Color eveningAccent = Color(0xFFF6B6B7);

  static const Color onPrimary = Color(0xFF3C3A3A);

  static ThemeData get base {
    return ThemeData(
      primaryColor: defaultPrimary,
      backgroundColor: defaultPrimary,
      scaffoldBackgroundColor: defaultPrimary,
      colorScheme: const ColorScheme(
        primary: defaultPrimary,
        primaryVariant: defaultPrimary,
        secondary: defaultAccent,
        secondaryVariant: defaultAccent,
        surface: defaultPrimary,
        background: defaultPrimary,
        error: onPrimary,
        onPrimary: onPrimary,
        onSecondary: onPrimary,
        onSurface: onPrimary,
        onBackground: onPrimary,
        onError: onPrimary,
        brightness: Brightness.light,
      ),
      textTheme: TextTheme(
        headline1: GoogleFonts.workSans(
          fontSize: 102,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
        ),
        headline2: GoogleFonts.workSans(
          fontSize: 64,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
        ),
        headline3: GoogleFonts.workSans(
          fontSize: 51,
          fontWeight: FontWeight.w400,
        ),
        headline4: GoogleFonts.workSans(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.25,
        ),
        headline5: GoogleFonts.workSans(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
        headline6: GoogleFonts.workSans(
          fontSize: 21,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
        ),
        subtitle1: GoogleFonts.workSans(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
        ),
        subtitle2: GoogleFonts.workSans(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        bodyText1: GoogleFonts.workSans(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        bodyText2: GoogleFonts.workSans(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        button: GoogleFonts.workSans(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
        caption: GoogleFonts.workSans(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        overline: GoogleFonts.workSans(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
      ).apply(
        displayColor: onPrimary,
        bodyColor: onPrimary,
      ),
      iconTheme: const IconThemeData(
        color: onPrimary,
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
      ),
      dividerColor: onPrimary,
    );
  }
}
