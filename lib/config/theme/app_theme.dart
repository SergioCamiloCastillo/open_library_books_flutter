import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'MonaSans',
      colorSchemeSeed: const Color(
          0xFF1533CF), // Color de semilla para el esquema de colores
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'MonaSans',
          color: Color(0xFF020202),
          fontWeight: FontWeight.w600, // Peso 400 para headline1
        ),
        displayMedium: TextStyle(
          fontFamily: 'MonaSans',
          color: Color(0xFF020202),
          fontWeight: FontWeight.w600, // Peso 400 para headline2
        ),
        displaySmall: TextStyle(
          fontFamily: 'MonaSans',
          color: Color(0xFF020202),
          fontWeight: FontWeight.w600, // Peso 400 para headline3
        ),
        headlineMedium: TextStyle(
          fontFamily: 'MonaSans',
          color: Color(0xFF020202),
          fontWeight: FontWeight.w600, // Peso 400 para headline4
        ),
        headlineSmall: TextStyle(
          fontFamily: 'MonaSans',
          color: Color(0xFF020202),
          fontWeight: FontWeight.w500, // Peso 400 para headline5
        ),
        titleLarge: TextStyle(
          fontFamily: 'MonaSans',
          color: Color(0xFF020202),
          fontSize: 22,
          fontWeight: FontWeight.w600, // Peso 400 para headline6
        ),
        bodyLarge: TextStyle(
          fontFamily: 'MonaSans',
          color: Color(0xFF020202),
          fontWeight: FontWeight.w600, // Peso 400 para bodyText1
        ),
        bodyMedium: TextStyle(
          fontFamily: 'MonaSans',
          color: Color(0xFF020202),
          fontWeight: FontWeight.w500, // Peso 400 para bodyText2
        ),
        bodySmall: TextStyle(
          fontFamily: 'MonaSans',
          color: Color(0xFF020202),
          fontWeight: FontWeight.w500, // Peso 400 para caption
        ),
        labelLarge: TextStyle(
          fontFamily: 'MonaSans',
          color: Color(0xFF020202),
          fontWeight: FontWeight.bold, // Peso 400 para button
        ),
        titleMedium: TextStyle(
          fontFamily: 'MonaSans',
          color: Color(0xFF020202),
          fontWeight: FontWeight.bold, // Peso 400 para subtitle1
        ),
        titleSmall: TextStyle(
          fontFamily: 'MonaSans',
          fontWeight: FontWeight.bold, // Peso 400 para subtitle2
          color: Color(0xFF020202), // Color de texto
        ),
      ),
    );
  }
}
