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
}) =>
    GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        width: width?.w ?? 388.w,
        height: height?.h ?? 45.h,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 0.50,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFFDFDFDF),
            ),
            borderRadius: BorderRadius.circular(
              radius?.r ?? 8.r,
            ),
          ),
          color: color ?? AppColorsLight.lightPrimaryColor,
        ),
        child: MaterialButton(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          height: 45.h,
          minWidth: 388.w,
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
  Color? colorSide,
  Function? onTap,
}) =>
    Container(
      alignment: Alignment.center,
      width: width?.w ?? 388.w,
      height: height?.h ?? 45.h,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: colorSide ?? const Color(0xFFDFDFDF),
          ),
          borderRadius: BorderRadius.circular(
            radius?.r ?? 8.r,
          ),
        ),
        color: color ?? AppColorsLight.lightPrimaryColor,
      ),
      child: MaterialButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 45.h,
        minWidth: 388.w,
        onPressed: function,
        child: widget,
      ),
    );

Widget defaultIconButton({
  required Function() function,
  required String image,
  double? width,
  double? height,
  double? radius,
  bool isUpperCase = false,
  Color? color,
  Color? colorSide,
  Function? onTap,
}) =>
    Container(
      alignment: Alignment.center,
      width: width?.w ?? 388.w,
      height: height?.h ?? 45.h,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: colorSide ?? Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(
            radius?.r ?? 8.r,
          ),
        ),
        color: color ?? Colors.transparent,
      ),
      child: MaterialButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 45.h,
        minWidth: 388.w,
        onPressed: function,
        child: Image.asset(image),
      ),
    );
