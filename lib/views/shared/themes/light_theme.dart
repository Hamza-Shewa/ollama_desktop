import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  primaryColor: Colors.blue,
  primaryColorLight: Colors.blue[200],
  listTileTheme: ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(Colors.blue),
    trackColor: WidgetStateProperty.all(Colors.blue[200]),
  ),
  brightness: Brightness.light,
);
