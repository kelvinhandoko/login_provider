import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal, brightness: Brightness.light),
);

final darkTheme = ThemeData(
  colorScheme:
      ColorScheme.fromSeed(seedColor: Colors.teal, brightness: Brightness.dark),
);
