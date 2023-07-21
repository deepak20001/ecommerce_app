import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color(0xFFAA27FB),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: const Color(0xFFAA27FB),
      side: const BorderSide(
        color: Color(0xFFAA27FB),
        width: 1.7,
      ),
      textStyle: const TextStyle(
        color: Color(0xFFAA27FB),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: outlineInputBorder,
    errorBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
    prefixIconColor: const Color(0xFFAA27FB),
    suffixIconColor: const Color(0xFFAA27FB),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFAA27FB),
      textStyle: const TextStyle(
        fontSize: 18.0,
      ),
      disabledBackgroundColor: Colors.grey,
    ),
  ),
  canvasColor: const Color(0xFFAA27FB),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0.0,
    toolbarTextStyle: TextStyle(
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Color(0xFFAA27FB),
    ),
  ),
  primarySwatch: customColor,
);

OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.grey,
  ),
);

// Define your custom MaterialColor
MaterialColor customColor = const MaterialColor(0xFFAA27FB, {
  50: Color(0xFFE5CBFB),
  100: Color(0xFFD095FB),
  200: Color(0xFFC25FFA),
  300: Color(0xFFB22BFA),
  400: Color(0xFFAA27FB), // This is the primary color
  500: Color(0xFF9B04F8),
  600: Color(0xFF8903D2),
  700: Color(0xFF7503AD),
  800: Color(0xFF620388),
  900: Color(0xFF4E0263),
});
