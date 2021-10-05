


import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

class AppThemes {
  static ThemeData theme = ThemeData(
    primaryColor: AppColors.main,
    primarySwatch: Colors.blue,
    primaryTextTheme: TextTheme(button: TextStyle(color: Colors.white)),
    appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        textTheme:
        // ignore: deprecated_member_use
        TextTheme(title: TextStyle(color: Colors.black, fontSize: 18)),
        brightness: Brightness.dark,
        shadowColor: AppColors.shadowColor),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.main,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    cursorColor: AppColors.main,
    focusColor: AppColors.main,
    fontFamily: 'Roboto',
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide.none),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide.none),
        fillColor: AppColors.main.withOpacity(0.1),
        hintStyle: AppTextStyle.grayS16Regular,
        focusColor: AppColors.main,
        errorStyle: TextStyle(color: Colors.red),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.red))),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 10,
      selectedItemColor: AppColors.main,
      selectedLabelStyle: AppTextStyle.pinkS11Regular,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      selectedIconTheme: IconThemeData(color: AppColors.main, size: 24),
      showUnselectedLabels: true,
      unselectedIconTheme: IconThemeData(
        color: AppColors.main,
        size: 24,
      ),
      unselectedItemColor: AppColors.main,
      unselectedLabelStyle: AppTextStyle.blackS12Regular,
    ),
  );
}
