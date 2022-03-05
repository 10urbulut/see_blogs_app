import 'package:flutter/material.dart';

class InThemeData {
  static ThemeData get themeData {
    return ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'Roboto',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      splashColor: Colors.black,
      dividerColor: Colors.transparent,cardColor: Colors.grey.shade100,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.black,
          onPrimary: Colors.black,
          secondary: Colors.amber,
          onSecondary: Colors.amber,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.white,
          onBackground: Colors.blueGrey,
          surface: Colors.green,
          onSurface: Colors.green),
      scaffoldBackgroundColor: Colors.white,
      primaryIconTheme: const IconThemeData(
        color: Colors.black,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      // colorScheme: ColorScheme.dark(),
    );
  }
}
