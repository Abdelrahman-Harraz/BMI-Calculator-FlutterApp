import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OwnTheme {
  //  ------------------------------- colorPalette ----------------------------
  static const Color primaryColor = Color(0xFF68CEC5);
  static const Color secondaryColor = Color(0xFFF9D84B);
  static const Color backgroundColor = Color(0xFFF2F2F2);
  static const Color textColor = Color(0xFF333333);
  static const Color callToActionColor = Color(0xFF54AFA4);
  static const Color informationColor = Color(0xFF009900);
  static const Color errorWarningColor = Color(0xFFFF0000);
  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
  static const Color red = Colors.red;
  static const Color grey = Colors.grey;
  static const Color black = Colors.black;

//  ------------------------------- Various Fonts Style -------------------------
  static ThemeData themeData() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: OwnTheme.white,
        titleTextStyle: OwnTheme.bodyTextStyle(),
      ),
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: primaryColor,
            secondary: secondaryColor,
          ),
    );
  }

  ///18
  static TextStyle titleStyle() {
    return TextStyle(
      fontSize: 18.sp,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    );
  }

  ///14
  static TextStyle bodyTextStyle() {
    return TextStyle(
      fontSize: 14.sp,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    );
  }

  ///20
  static TextStyle buttonTextStyle() {
    return TextStyle(
      fontSize: 20.sp,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    );
  }

  ///16
  static TextStyle captionTextStyle() {
    return TextStyle(
      fontSize: 16.sp,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    );
  }

  ///11
  static TextStyle datestyle() {
    return TextStyle(
      fontSize: 11.sp,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    );
  }

  ///16
  static TextStyle errorTextStyle() {
    return TextStyle(
      fontSize: 16.sp,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    );
  }
}
