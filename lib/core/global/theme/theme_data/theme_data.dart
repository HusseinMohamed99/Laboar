import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laboar/core/global/theme/app_color/app_color_dark.dart';
import 'package:laboar/core/global/theme/app_color/app_color_light.dart';
import 'package:laboar/core/utils/enum.dart';

final getThemeData = {
  AppTheme.lightTheme: ThemeData(
    scaffoldBackgroundColor: AppColorsLight.scaffoldBackgroundColor,
    primaryColor: AppColorsLight.lightPrimaryColor,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColorsLight.bottomSheetColor,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ).r,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.quicksand(
        color: AppColorsLight.textBlackColor,
        fontSize: 48.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.quicksand(
        color: AppColorsLight.textBlackColor,
      ),
      bodySmall: GoogleFonts.quicksand(
        color: AppColorsLight.textBlackColor,
      ),
      titleLarge: GoogleFonts.quicksand(
        color: AppColorsLight.textBlackColor,
        fontSize: 34.sp,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.quicksand(
        color: AppColorsLight.textBlackColor,
        fontSize: 14.sp,
      ),
      titleSmall: GoogleFonts.quicksand(
        color: AppColorsLight.textBlackColor,
      ),
      labelLarge: GoogleFonts.quicksand(
        color: AppColorsLight.textBlackColor,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: GoogleFonts.quicksand(
        color: AppColorsLight.textBlackColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
      labelSmall: GoogleFonts.quicksand(
        color: AppColorsLight.textBlackColor.withOpacity(0.50),
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        size: 30.sp,
        color: AppColorsLight.lightPrimaryColor,
      ),
      unselectedIconTheme: IconThemeData(
        size: 24.sp,
        color: Colors.white,
      ),
      selectedLabelStyle: const TextStyle(
        color: AppColorsLight.lightPrimaryColor,
      ),
      selectedItemColor: AppColorsLight.lightPrimaryColor,
    ),
  ),
  AppTheme.darkTheme: ThemeData(
    scaffoldBackgroundColor: AppColorsDark.darkPrimary,
    primaryColor: AppColorsDark.darkPrimary,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColorsDark.greyDarkColor,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ).r,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.quicksand(
        color: AppColorsDark.textColor,
      ),
      bodyMedium: GoogleFonts.quicksand(
        color: AppColorsDark.textColor,
      ),
      bodySmall: GoogleFonts.quicksand(
        color: AppColorsDark.textColor,
      ),
      titleLarge: GoogleFonts.quicksand(
        color: AppColorsDark.textColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: GoogleFonts.quicksand(
        color: AppColorsDark.textColor,
        fontSize: 14.sp,
      ),
      titleSmall: GoogleFonts.quicksand(
        color: AppColorsDark.textColor,
      ),
      labelLarge: GoogleFonts.quicksand(
        color: AppColorsDark.textColor,
        fontSize: 18.sp,
      ),
      labelMedium: GoogleFonts.quicksand(
        color: AppColorsDark.textColor,
        fontSize: 16.sp,
      ),
      labelSmall: GoogleFonts.quicksand(
        color: AppColorsDark.textColor,
        fontSize: 12.sp,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        size: 30.sp,
        color: AppColorsDark.primaryGreenColor,
      ),
      unselectedIconTheme: IconThemeData(
        size: 24.sp,
        color: Colors.white,
      ),
      selectedLabelStyle: GoogleFonts.quicksand(
        color: AppColorsDark.primaryGreenColor,
      ),
      selectedItemColor: AppColorsDark.primaryGreenColor,
    ),
  ),
};
