import "package:flutter/material.dart";

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

class MyAppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: kColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: kColorScheme.onPrimaryContainer,
      foregroundColor: kColorScheme.primaryContainer,
    ),
    cardTheme: CardTheme(
      color: kColorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kColorScheme.primaryContainer,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: kColorScheme.onSecondaryContainer,
        fontSize: 16,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: kDarkColorScheme,
    cardTheme: CardTheme(
      color: kDarkColorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kDarkColorScheme.primaryContainer,
        foregroundColor: kDarkColorScheme.onPrimaryContainer,
      ),
    ),
  );

  static const themeMode = ThemeMode.system;
}
