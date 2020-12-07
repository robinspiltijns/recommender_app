import 'package:flutter/material.dart';

var themeData = new ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: Color(0xFFEF476F),
    buttonColor: Color(0x26FFFFFF),
    textTheme: TextTheme(
        headline6: TextStyle(
          // Main view titles
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 36.0),
        headline5: TextStyle(
          // Secondary view titles
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30.0),
        headline1: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 36.0, color: Colors.white),
        headline2: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white,
        ),
        bodyText1: TextStyle(
          color: Colors.white,
          fontSize: 12.0,
        ),
        bodyText2: TextStyle(
          color: Colors.white.withOpacity(0.72),
          fontSize: 12.0,
        )));

extension CustomStyles on TextTheme {
  TextStyle get description =>
      TextStyle(
        color: Colors.white,
        fontSize: 12,
      );
  TextStyle get genreTitle => TextStyle(
    fontSize: 18.0,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
  TextStyle get episodeTitle => TextStyle(
    fontSize: 14.0,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
  TextStyle get episodePublisher => TextStyle(
    fontSize: 14.0,
    color: Colors.white.withOpacity(0.5),
    fontWeight: FontWeight.w600,
  );
  TextStyle get timeDuration => TextStyle(
    fontSize: 12.0,
    color: Colors.white.withOpacity(0.5),
    fontWeight: FontWeight.w400,
  );
  TextStyle get episodeDuration => TextStyle(
    fontSize: 12.0,
    color: Color(0xBAFFFFFF),
    fontWeight: FontWeight.w600,
  );
  TextStyle get podcastTitle => TextStyle(
    fontSize: 16.0,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
  TextStyle get podcastProducer => TextStyle(
    fontSize: 16.0,
    color: Color(0xBAFFFFFF),
    fontWeight: FontWeight.w600,
  );
  TextStyle get buttonText => TextStyle(
    fontSize: 12.0,
    color: themeData.primaryColor,
    fontWeight: FontWeight.w700,
  );
}
