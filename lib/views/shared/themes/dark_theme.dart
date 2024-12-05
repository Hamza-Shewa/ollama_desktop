import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primaryColor: Colors.purple,
  primaryColorLight: Colors.purple[200],
  listTileTheme: ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(Colors.purple),
    trackColor: WidgetStateProperty.all(Colors.purple[200]),
  ),
  brightness: Brightness.dark,
);
