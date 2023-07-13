import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laboar/core/components/buttons.dart';
import 'package:laboar/core/components/my_divider.dart';
import 'package:laboar/core/components/navigator.dart';
import 'package:laboar/core/components/on_tap_function.dart';
import 'package:laboar/core/components/size_box.dart';
import 'package:laboar/core/cubit/laboarCubit/laboar_cubit.dart';
import 'package:laboar/core/cubit/laboarCubit/laboar_state.dart';
import 'package:laboar/core/global/theme/app_color/app_color_light.dart';
import 'package:laboar/core/global/theme/theme_data/theme_data.dart';
import 'package:laboar/core/utils/enum.dart';
import 'package:laboar/generated/assets.dart';
import 'package:laboar/presentation/onBoarding/pref_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = getThemeData[AppTheme.lightTheme]!.textTheme;
    var cubit = LaboarCubit.get(context);
    var localizations = AppLocalizations.of(context)!;
    return BlocConsumer<LaboarCubit, LaboarState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 10.h,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space(height: 20.h, width: 0),
                  SvgPicture.asset(Assets.imagesOnBoarding),
                  Space(height: 44.h, width: 0),
                  Text(
                    localizations.title,
                    style: textTheme.bodyLarge,
                  ),
                  Space(height: 58.h, width: 0),
                  Text(
                    localizations.selectLanguage,
                    style: textTheme.labelLarge,
                  ),
                  Space(height: 15.h, width: 0),
                  OnTapFunction(
                    function: () {
                      cubit.changeLanguage('en');
                    },
                    child: SizedBox(
                      height: 46.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            localizations.english,
                            style: textTheme.labelMedium,
                          ),
                          cubit.currentLanguage == 'en'
                              ? getSelectedLanguageItem()
                              : getUnSelectedLanguageItem(),
                        ],
                      ),
                    ),
                  ),
                  MyDivider(
                    color: AppColorsLight.blackColor,
                    height: 1.h,
                  ),
                  OnTapFunction(
                    function: () {
                      cubit.changeLanguage('ar');
                    },
                    child: SizedBox(
                      height: 46.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            localizations.arabic,
                            style: textTheme.labelMedium,
                          ),
                          cubit.currentLanguage == 'ar'
                              ? getSelectedLanguageItem()
                              : getUnSelectedLanguageItem(),
                        ],
                      ),
                    ),
                  ),
                  MyDivider(
                    color: AppColorsLight.blackColor,
                    height: 1.h,
                  ),
                  Space(height: 20.h, width: 0),
                  cubit.currentLanguage == 'en'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                checkBox(context),
                                Text(
                                  localizations.loginHere,
                                  style: textTheme.labelSmall,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 45.0).r,
                              child: Text(
                                localizations.termAndConditions,
                                style: textTheme.labelSmall!.copyWith(
                                  color: const Color(0xFF5FD068),
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            checkBox(context),
                            Text(
                              localizations.loginHere,
                              style: textTheme.labelSmall,
                            ),
                            Space(height: 0, width: 5.w),
                            Text(
                              localizations.termAndConditions,
                              style: textTheme.labelSmall!.copyWith(
                                color: const Color(0xFF5FD068),
                                fontWeight: FontWeight.w700,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                  Space(height: 36.h, width: 0),
                  defaultMaterialButton(
                    function: () {
                      navigateTo(context, const PrefScreen());
                    },
                    text: localizations.enter,
                    color: AppColorsLight.lightPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget getSelectedLanguageItem() {
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
          color: AppColorsLight.lightPrimaryColor,
          shape: OvalBorder(),
        ),
      ),
    );
  }

  Widget getUnSelectedLanguageItem() {
    return Container(
      width: 23.w,
      height: 20.h,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: OvalBorder(
          side: BorderSide(
            width: 2,
            color: AppColorsLight.lightPrimaryColor,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }

  Widget checkBox(BuildContext context) {
    var cubit = LaboarCubit.get(context);
    return Checkbox(
      side: const BorderSide(
        color: AppColorsLight.lightPrimaryColor,
      ),
      activeColor: AppColorsLight.lightPrimaryColor,
      value: cubit.isCheck,
      onChanged: (e) {
        cubit.boxCheck(e!);
      },
    );
  }
}
