import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laboar/core/global/theme/app_color/app_color_light.dart';

Widget defaultMaterialButton({
  required Function() function,
  required String text,
  double? width,
  double? height,
  double? radius,
  bool isUpperCase = false,
  Color? color,
  Function? onTap,
}) =>
    Container(
      width: width?.w ?? 388.w,
      height: height?.h ?? 45.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius?.r ?? 16.r,
        ),
        color: color,
      ),
      child: MaterialButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 22.h,
        minWidth: 59.w,
        onPressed: function,
        child: Text(
          textAlign: TextAlign.center,
          isUpperCase ? text.toUpperCase() : text,
          style: GoogleFonts.quicksand(
            fontSize: 18.sp,
            color: AppColorsLight.textWhiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );

Widget defaultButton({
  required Function() function,
  required Widget widget,
  double? width,
  double? height,
  double? radius,
  bool isUpperCase = false,
  Color? color,
  Function? onTap,
}) =>
    Container(
      width: width?.w ?? 310.w,
      height: height?.h ?? 43.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius?.r ?? 10.r,
        ),
        color: color,
      ),
      child: MaterialButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 22.h,
        minWidth: 59.w,
        onPressed: function,
        child: FittedBox(
          child: widget,
        ),
      ),
    );
