

import 'package:flutter/material.dart';

var themeData = new ThemeData(
  scaffoldBackgroundColor: Colors.transparent,
  primaryColor: Color(0xFFEF476F),
  buttonColor: Color(0x26FFFFFF),
  textTheme: TextTheme(
    headline1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 36.0,
        color: Colors.white
    ),
    headline2: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: Colors.white,
    ),
  )
);

extension CustomStyles on TextTheme {
    TextStyle get genreTitle =>
        TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
        );
    TextStyle get episodeTitle =>
        TextStyle(
          fontSize: 14.0,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        );
    TextStyle get episodeDuration =>
        TextStyle(
          fontSize: 12.0,
          color: Color(0xBAFFFFFF),
          fontWeight: FontWeight.w600,
        );
    TextStyle get buttonText =>
        TextStyle(
          fontSize: 12.0,
          color: themeData.primaryColor,
          fontWeight: FontWeight.w600,
        );
}