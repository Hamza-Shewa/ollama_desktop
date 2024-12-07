import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  fontFamily: 'Tajawal',
  primaryColor: Colors.indigoAccent,
  primaryColorLight: Colors.blue[200],
  listTileTheme: ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.indigoAccent,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(Colors.indigoAccent),
    trackColor: WidgetStateProperty.all(Colors.indigo[200]),
  ),
  colorScheme: ColorScheme.light(
    primaryContainer: Colors.white,
    secondaryContainer: Colors.grey[200],
    shadow: Colors.indigoAccent[100]!.withOpacity(0.2),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w900,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      color: Colors.black87,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Colors.black87,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      color: Colors.grey,
    ),
  ),
  brightness: Brightness.light,
);
