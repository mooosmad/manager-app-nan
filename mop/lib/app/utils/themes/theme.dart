import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mop/app/utils/constants/constant.dart';

class ThemeMop {
  static final ligthTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: ConstantColors.primaryColor2,
      foregroundColor: Colors.black,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: const Color(0xfffdc72f),
      onPrimary: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ConstantColors.primaryColor2,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    iconTheme: IconThemeData(
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(
        const Color(0xfffdc72f),
      ),
    ),
    dialogTheme: const DialogTheme(
      contentTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: "poppins",
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: "poppins",
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    cardTheme: const CardTheme(color: Colors.white),
    shadowColor: Colors.grey.withOpacity(0.1),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: "poppins",
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.black,
      ),
      headline2: TextStyle(
        fontFamily: "poppins",
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        fontFamily: "poppins",
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        fontFamily: "poppins",
        color: Colors.black,
      ),
    ),
  );
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color.fromARGB(255, 29, 29, 30),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(const Color(0xfffdc72f)),
    ),
    dialogBackgroundColor: const Color.fromARGB(255, 36, 36, 41),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 29, 29, 30),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    shadowColor: Colors.black.withOpacity(0.1),
    dialogTheme: const DialogTheme(
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: "poppins",
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: "poppins",
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    cardTheme: const CardTheme(color: Color.fromARGB(255, 36, 36, 41)),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: const Color(0xfffdc72f),
      onPrimary: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    iconTheme: IconThemeData(
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: "poppins",
        fontWeight: FontWeight.bold,
        fontSize: 35,
        color: Colors.white,
      ),
      headline2: TextStyle(
        fontFamily: "poppins",
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Colors.white,
      ),
      bodyText1: TextStyle(
        fontFamily: "poppins",
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        fontFamily: "poppins",
        color: Colors.white,
      ),
    ),
  );
}
