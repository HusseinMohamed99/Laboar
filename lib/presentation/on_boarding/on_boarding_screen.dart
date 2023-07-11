import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laboar/core/components/buttons.dart';
import 'package:laboar/core/components/my_divider.dart';
import 'package:laboar/core/components/navigator.dart';
import 'package:laboar/core/components/size_box.dart';
import 'package:laboar/core/global/theme/app_color/app_color_light.dart';
import 'package:laboar/core/global/theme/theme_data/theme_data.dart';
import 'package:laboar/core/utils/enum.dart';
import 'package:laboar/generated/assets.dart';
import 'package:laboar/presentation/on_boarding/pref_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeData[AppTheme.lightTheme]!.textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 10.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space(height: 30.h, width: 0),
            SvgPicture.asset(Assets.imagesOnBoarding),
            Space(height: 44.h, width: 0),
            Text(
              'Find Your\nHome Service',
              style: textTheme.bodyLarge,
            ),
            Space(height: 58.h, width: 0),
            Text(
              'Select Language',
              style: textTheme.titleLarge,
            ),
            Space(height: 15.h, width: 0),
            SizedBox(
              height: 46.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'English',
                    style: textTheme.titleLarge,
                  ),
                  InkWell(onTap: () {}, child: getSelectedItem()),
                ],
              ),
            ),
            MyDivider(
              color: AppColorsLight.blackColor,
              height: 1.h,
            ),
            SizedBox(
              height: 46.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Arabic',
                    style: textTheme.titleLarge,
                  ),
                  InkWell(onTap: () {}, child: getUnSelectedItem()),
                ],
              ),
            ),
            MyDivider(
              color: AppColorsLight.blackColor,
              height: 1.h,
            ),
            Space(height: 20.h, width: 0),
            Text(
              'By creating an account, you agree to our',
              style: textTheme.labelSmall,
            ),
            Text(
              'Term and Conditions',
              style: textTheme.labelSmall!.copyWith(
                  color: const Color(0xFF5FD068),
                  fontWeight: FontWeight.w700,
                  height: 2),
            ),
            Space(height: 36.h, width: 0),
            defaultMaterialButton(
              function: () {
                navigateTo(context, const PrefScreen());
              },
              text: 'Enter',
              color: AppColorsLight.lightPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget getSelectedItem() {
    return Container(
      width: 23.w,
      height: 20.h,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: OvalBorder(
          side: BorderSide(
              width: 2, color: Color(0xFF5FD068), style: BorderStyle.solid),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(4).r,
        width: 10.w,
        height: 10.h,
        decoration: const ShapeDecoration(
          color: Color(0xFF5FD068),
          shape: OvalBorder(),
        ),
      ),
    );
  }

  Widget getUnSelectedItem() {
    return Container(
      width: 23.w,
      height: 20.h,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: OvalBorder(
          side: BorderSide(
              width: 2, color: Color(0xFF5FD068), style: BorderStyle.solid),
        ),
      ),
    );
  }
}
