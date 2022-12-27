import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_clean_architecture/core/global/theme/app_color/app_colors_dark.dart';

ThemeData getThemeDataDark() => ThemeData(
    scaffoldBackgroundColor: AppColorsDark.dark,
    primaryColor: AppColorsDark.pomegranate,
    disabledColor: AppColorsDark.alto,
    primaryColorLight: AppColorsDark.white,
    hintColor: AppColorsDark.silver,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: AppColorsDark.dark),
    fontFamily: GoogleFonts.lato().fontFamily,
    textTheme: TextTheme(
      headline5: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w400),
      bodyText2: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
      subtitle1: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w400),
      overline: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
    ));
