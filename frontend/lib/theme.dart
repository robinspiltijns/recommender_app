

import 'package:flutter/material.dart';

var themeData =  new ThemeData(
  scaffoldBackgroundColor: Colors.transparent,
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
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
        );
}