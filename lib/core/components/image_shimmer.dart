import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laboar/core/global/theme/app_color/app_color_dark.dart';
import 'package:shimmer/shimmer.dart';

class ImageWithShimmer extends StatelessWidget {
  const ImageWithShimmer({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.boxFit,
  });

  final String imageUrl;
  final double height;
  final double width;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: boxFit ?? BoxFit.cover,
      placeholder: (_, __) => Shimmer.fromColors(
        baseColor: Colors.grey[850]!,
        highlightColor: Colors.grey[800]!,
        child: Container(
          height: height,
          color: AppColorsDark.primaryGreenColor,
        ),
      ),
      errorWidget: (_, __, ___) => Icon(
        Icons.error,
        color: Colors.red,
        size: 24.sp,
      ),
    );
  }
}
