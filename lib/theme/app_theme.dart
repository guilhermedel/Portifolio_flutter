import 'package:flutter/material.dart';

class AppTheme {
  // Definindo as cores principais
  static const Color primaryColor = Colors.blue;
  static const Color hintColor = Colors.amber;
  static const Color backgroundColorLight = Colors.white;
  static const Color backgroundColorDark = Colors.black;
  static const Color textColorLight = Colors.black;
  static const Color textColorDark = Colors.white;

  // Definindo o tema claro
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    hintColor: hintColor,
    scaffoldBackgroundColor: backgroundColorLight,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      iconTheme: IconThemeData(color: textColorLight),
      actionsIconTheme: IconThemeData(color: Colors.white)
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: textColorLight),
      bodyMedium: TextStyle(color: textColorLight),
    ),
    
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // Definindo o tema escuro
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    hintColor: hintColor,
    scaffoldBackgroundColor: backgroundColorDark,
    // appBarTheme: const AppBarTheme(
    //   color: backgroundColorDark,
    //   iconTheme: IconThemeData(color: textColorDark), 
    // ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: textColorDark),
      bodyMedium: TextStyle(color: textColorDark),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
