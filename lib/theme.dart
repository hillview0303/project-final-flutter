import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme() {
  return TextTheme(
    displayLarge: GoogleFonts.openSans(fontSize: 18.0, color: Colors.black),
    displayMedium: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black),
    bodyMedium: GoogleFonts.openSans(fontSize: 14.0, color: Colors.grey),
    titleMedium: GoogleFonts.openSans(fontSize: 15.0, color: Colors.black),
    titleLarge: GoogleFonts.openSans(fontSize: 30.0, color: Colors.teal, fontWeight: FontWeight.bold),
  );
}


IconThemeData iconTheme() {
  return const IconThemeData(
    color: Colors.black,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    centerTitle: false,
    color: Colors.white,
    elevation: 0.0,
    iconTheme: iconTheme(),
    titleTextStyle: GoogleFonts.nanumGothic(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
}

BottomNavigationBarThemeData bottomNavigatorTheme() {
  return const BottomNavigationBarThemeData(
    selectedItemColor: Colors.orange,
    unselectedItemColor: Colors.black54,
    showUnselectedLabels: true,
  );
}
ElevatedButtonThemeData elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8) // 버튼의 모서리를 둥글게 처리
      ),
      elevation: 10, // 버튼의 그림자 높이
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0), // 버튼 내부 패딩
    ),
  );
}

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    appBarTheme: appBarTheme(),
    bottomNavigationBarTheme: bottomNavigatorTheme(),
    primarySwatch: Colors.orange,
    elevatedButtonTheme: elevatedButtonThemeData(),
  );
}