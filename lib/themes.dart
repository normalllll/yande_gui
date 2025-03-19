import 'package:flutter/material.dart';

ThemeData lightTheme(Color primaryColor) => ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: primaryColor,
        primary: primaryColor,
        surface: const Color(0xffffffff),
        primaryContainer: primaryColor,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Color(0xFF202020)),
        titleMedium: TextStyle(color: Color(0xFF202020)),
        titleSmall: TextStyle(color: Color(0xFF202020)),
        bodyLarge: TextStyle(color: Color(0xFF403F3F)),
        bodyMedium: TextStyle(color: Color(0xFF403F3F)),
        bodySmall: TextStyle(color: Color(0xFF403F3F)),
        labelLarge: TextStyle(color: Color(0xFF6B6B6B)),
        labelMedium: TextStyle(color: Color(0xFF6B6B6B)),
        labelSmall: TextStyle(color: Color(0xFF6B6B6B)),
      ),
      scaffoldBackgroundColor: const Color(0xFFF7F9FC),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xffffffff),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: const Color(0xfffafafa),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: Color(0xFFF0F3F6),
        indicatorColor: primaryColor,
      ),
      iconTheme: IconThemeData(
        color: const Color(0xff7B8290),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color(0xFFEFEFEF),
        hintStyle: TextStyle(color: Color(0xff222222)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10), // 内边距
      ),
      cardTheme: CardTheme(
        color: Color(0xfffafafa),
      ),
      cardColor: Color(0xfffafafa),
      listTileTheme: ListTileThemeData(
        tileColor: Color(0xFFEFEFEF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );

ThemeData darkTheme(Color primaryColor) => ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: primaryColor,
        primary: primaryColor,
        surface: const Color(0xFF000000),
        primaryContainer: primaryColor,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Color(0xFFFFFFFF)),
        titleMedium: TextStyle(color: Color(0xFFFFFFFF)),
        titleSmall: TextStyle(color: Color(0xFFFFFFFF)),
        bodyLarge: TextStyle(color: Color(0xFFE6E6E6)),
        bodyMedium: TextStyle(color: Color(0xFFE6E6E6)),
        bodySmall: TextStyle(color: Color(0xFFE6E6E6)),
        labelLarge: TextStyle(color: Color(0xFFB0B0B0)),
        labelMedium: TextStyle(color: Color(0xFFB0B0B0)),
        labelSmall: TextStyle(color: Color(0xFFB0B0B0)),
      ),
      scaffoldBackgroundColor: const Color(0xFF000000),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF000000),
        elevation: 0,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: const Color(0xFF1A1A1A),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: Color(0xFF101010),
        indicatorColor: primaryColor,
      ),
      iconTheme: IconThemeData(
        color: const Color(0xFFD1D1D1),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color(0xFF1A1A1A),
        hintStyle: TextStyle(color: Color(0xFF8C8C8C)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      cardTheme: CardTheme(
        color: Color(0xFF1A1A1A),
      ),
      cardColor: Color(0xFF1A1A1A),
      listTileTheme: ListTileThemeData(
        tileColor: Color(0xFF1A1A1A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
