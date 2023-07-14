import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laboar/core/global/theme/app_color/app_color_light.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField(
      {required this.context,
      required this.controller,
      required this.keyboardType,
      required this.validate,
      this.hint,
      this.label,
      this.onTap,
      this.onChanged,
      this.onFieldSubmitted,
      this.obscuringCharacter,
      this.style,
      this.color,
      this.borderSideColor,
      this.prefixColor,
      this.styleColor,
      this.focusNode,
      this.isClickable,
      this.isPassword,
      this.decoration,
      this.suffix,
      this.suffixPressed,
      this.prefix,
      this.maxLength,
      Key? key})
      : super(key: key);
  final BuildContext context;
  final FocusNode? focusNode;
  final Color? color;
  final Color? borderSideColor;
  final Color? styleColor;
  final Color? prefixColor;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?) validate;
  final String? hint;
  final String? label;
  final dynamic onTap;
  final dynamic onChanged;
  final Function(String)? onFieldSubmitted;
  final bool? isPassword;
  final bool? isClickable;
  final InputDecoration? decoration;
  final IconData? suffix;
  final IconData? prefix;
  final Function? suffixPressed;
  final TextStyle? style;
  final String? obscuringCharacter;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0).r,
      child: TextFormField(
        cursorColor: AppColorsLight.lightPrimaryColor,
        maxLength: maxLength,
        focusNode: focusNode,
        textAlignVertical: TextAlignVertical.center,
        style: GoogleFonts.quicksand(
          fontStyle: FontStyle.normal,
          color: styleColor ?? AppColorsLight.blackColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        maxLines: 1,
        minLines: 1,
        obscuringCharacter: obscuringCharacter ?? '*',
        controller: controller,
        validator: validate,
        enabled: isClickable ?? true,
        onTap: onTap,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        obscureText: isPassword ?? false,
        keyboardType: keyboardType,
        autofocus: false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 8, 8, 20).r,
          fillColor: color ?? AppColorsLight.fillColor,
          filled: true,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(15.0).r,
            child: Icon(
              suffix,
              color: AppColorsLight.greyColor,
              size: 24.sp,
            ),
          ),
          // suffixIcon: suffix != null
          //     ? IconButton(
          //         padding: const EdgeInsets.all(15.0).r,
          //         onPressed: () {
          //           suffixPressed!();
          //         },
          //         icon: Icon(
          //           suffix,
          //           //    color: ThemeApp.secondaryColor,
          //           size: 24.sp,
          //         ),
          //       )
          //     : null,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              const Radius.circular(8.0).r,
            ),
            borderSide: const BorderSide(
              color: AppColorsLight.lightPrimaryColor,
            ),
          ),
          hintText: hint,
          hintStyle: GoogleFonts.quicksand(
            color: AppColorsLight.greyColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          focusColor: AppColorsLight.lightPrimaryColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              const Radius.circular(8.0).r,
            ),
            borderSide: const BorderSide(
              color: AppColorsLight.lightPrimaryColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              const Radius.circular(8.0).r,
            ),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              const Radius.circular(8.0).r,
            ),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          errorStyle: GoogleFonts.quicksand(color: Colors.red, fontSize: 12.sp),
        ),
      ),
    );
  }
}
