// lib/theme.dart
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
      bodyMedium: TextStyle(
        fontSize: 16.0,
        fontFamily: 'Poppins',
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 239, 32, 156),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
    primaryColor: Colors.amber,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
      bodyMedium: TextStyle(
        fontSize: 16.0,
        fontFamily: 'Poppins',
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    ),
    cardColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
