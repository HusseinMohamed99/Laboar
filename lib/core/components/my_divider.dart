import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({this.color, this.height, this.width, Key? key})
      : super(key: key);
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.10,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 2.0.h,
        decoration: ShapeDecoration(
          color: color ?? Colors.grey,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              width: 0.50,
              strokeAlign: BorderSide.strokeAlignCenter,
            ),
          ),
        ),
      ),
    );
  }
}
