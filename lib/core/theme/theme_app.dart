import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

class ThemeApp {
  static TextTheme _textTheme() => TextTheme(
        button: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        headline1: GoogleFonts.poppins(
          color: ColorsConst.textColor,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        headline2: GoogleFonts.poppins(
          color: ColorsConst.textColor,
          fontSize: 15,
        ),
        headline3: GoogleFonts.poppins(
          color: ColorsConst.textSecondColor,
          fontSize: 13,
        ),
        bodyText1: GoogleFonts.poppins(
          color: ColorsConst.textSecondColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        bodyText2: GoogleFonts.poppins(
          color: ColorsConst.textColor,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      );

  static ThemeData theme() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: ColorsConst.secondaryColor),
    );
    return ThemeData(
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
          backgroundColor: MaterialStateProperty.all(ColorsConst.accentColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.white,
        hintStyle: GoogleFonts.poppins(
          color: ColorsConst.textSecondColor,
          fontSize: 12,
        ),
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: ColorsConst.primaryColor),
        backgroundColor: ColorsConst.secondaryColor,
        elevation: 0,
      ),
      primaryColor: ColorsConst.primaryColor,
      accentColor: ColorsConst.accentColor,
      secondaryHeaderColor: ColorsConst.secondaryColor,
      backgroundColor: Color(0xff9B9B9B),
      textTheme: _textTheme(),
    );
  }
}
