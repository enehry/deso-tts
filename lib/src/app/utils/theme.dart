import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF1A434E),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF1A434E),
  ),
  textTheme: const TextTheme(
    subtitle1: TextStyle(
      fontSize: 12,
      fontFamily: 'Poppins',
      color: Colors.white,
    ),
    subtitle2: TextStyle(
      fontSize: 14,
      fontFamily: 'Poppins',
    ),
    bodyText1: TextStyle(
      fontSize: 24,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A434E),
    ),
    bodyText2: TextStyle(
      fontSize: 18,
      fontFamily: 'Poppins',
      color: Color(0xFF1A434E),
    ),
    headline4: TextStyle(
      fontSize: 14,
      fontFamily: 'Poppins',
      color: Color(0xFF1A434E),
    ),
    headline5: TextStyle(
      fontSize: 20,
      fontFamily: 'Poppins',
      color: Color(0xFF1A434E),
    ),
    headline6: TextStyle(
      fontSize: 24,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
);
