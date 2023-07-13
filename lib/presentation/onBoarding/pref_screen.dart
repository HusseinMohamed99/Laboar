import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laboar/core/components/buttons.dart';
import 'package:laboar/core/components/navigator.dart';
import 'package:laboar/core/components/size_box.dart';
import 'package:laboar/core/cubit/laboarCubit/laboar_cubit.dart';
import 'package:laboar/core/global/theme/app_color/app_color_light.dart';
import 'package:laboar/core/global/theme/theme_data/theme_data.dart';
import 'package:laboar/core/network/cache_helper.dart';
import 'package:laboar/core/utils/enum.dart';
import 'package:laboar/generated/assets.dart';
import 'package:laboar/model/on_board_model.dart';
import 'package:laboar/presentation/homeScreen/home_screen.dart';
import 'package:laboar/presentation/registerScreen/register_screen.dart';

class PrefScreen extends StatefulWidget {
  const PrefScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PrefScreen> createState() => _PrefScreenState();
}

class _PrefScreenState extends State<PrefScreen> {
  var pageController = PageController();
  int currentValue = 0;

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(
      key: 'Pref',
      value: true,
    ).then((value) {
      if (value) {
        navigateAndFinish(context, const HomeScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context)!;
    final textTheme = getThemeData[AppTheme.lightTheme]!.textTheme;
    var cubit = LaboarCubit.get(context);
    List<BoardingModel> boarding = [
      BoardingModel(
        image: Assets.imagesPref1,
        title: localizations.title1,
        body: localizations.body1,
      ),
      BoardingModel(
        image: Assets.imagesPref2,
        title: localizations.title2,
        body: localizations.body2,
      ),
      BoardingModel(
        image: Assets.imagesPref3,
        title: localizations.title3,
        body: localizations.body3,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColorsLight.lightSecondaryColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 40.h,
        title: cubit.currentLanguage == "ar"
            ? Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    isLast ? '' : localizations.skip,
                    style: textTheme.labelLarge!.copyWith(
                      color: AppColorsLight.lightThirdColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    isLast ? '' : localizations.skip,
                    style: textTheme.labelLarge!.copyWith(
                      color: AppColorsLight.lightThirdColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0).r,
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (int index) {
                        if (index == boarding.length - 1) {
                          setState(() {
                            isLast = true;
                            currentValue = index;
                          });
                        } else {
                          setState(() {
                            isLast = false;
                            currentValue = index;
                          });
                        }
                      },
                      controller: pageController,
                      itemBuilder: (context, index) =>
                          buildBoardingItem(boarding[index]),
                      itemCount: boarding.length,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          boarding.length,
                          (index) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 780,
                              ),
                              curve: Curves.easeIn,
                              width: index == currentValue ? 35.w : 12,
                              height: 12,
                              decoration: ShapeDecoration(
                                color: index == currentValue
                                    ? AppColorsLight.lightThirdColor
                                    : AppColorsLight.greyColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20).r,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Space(height: 48.h, width: 0),
                      isLast
                          ? defaultMaterialButton(
                              function: () {
                                navigateTo(context, const RegisterScreen());
                              },
                              text: localizations.enter,
                              color: AppColorsLight.lightPrimaryColor,
                            )
                          : defaultMaterialButton(
                              function: () {
                                if (isLast) {
                                  submit();
                                } else {
                                  pageController.nextPage(
                                    duration: const Duration(
                                      milliseconds: 780,
                                    ),
                                    curve: Curves.easeIn,
                                  );
                                }
                              },
                              text: localizations.next,
                              color: AppColorsLight.lightPrimaryColor,
                            ),
                      Space(height: 48.h, width: 0),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) {
    final textTheme = getThemeData[AppTheme.lightTheme]!.textTheme;
    return Column(
      children: [
        SvgPicture.asset(
          model.image,
          width: 300.w,
          height: 250.h,
        ),
        Text(
          model.title,
          textAlign: TextAlign.center,
          style: textTheme.titleLarge,
        ),
        Space(height: 10.h, width: 0),
        Text(
          model.body,
          textAlign: TextAlign.center,
          style: textTheme.labelMedium!.copyWith(
            color: AppColorsLight.textBlackColor.withOpacity(0.50),
          ),
        ),
      ],
    );
  }
}
