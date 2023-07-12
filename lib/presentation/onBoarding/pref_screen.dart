import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laboar/core/components/buttons.dart';
import 'package:laboar/core/components/navigator.dart';
import 'package:laboar/core/components/size_box.dart';
import 'package:laboar/core/global/theme/app_color/app_color_light.dart';
import 'package:laboar/core/global/theme/theme_data/theme_data.dart';
import 'package:laboar/core/network/cache_helper.dart';
import 'package:laboar/core/utils/enum.dart';
import 'package:laboar/generated/assets.dart';
import 'package:laboar/model/on_board_model.dart';
import 'package:laboar/presentation/homeScreen/home_screen.dart';

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

  List<BoardingModel> boarding = [
    BoardingModel(
      image: Assets.imagesPref1,
      title: 'Easy Process',
      body:
          'Find all your house needs in one place.  We provide every service to make your home experience smooth.',
    ),
    BoardingModel(
      image: Assets.imagesPref2,
      title: 'Expert People',
      body:
          'We have the best in class individuals working just for you. They are well  trained and capable of handling anything you need.',
    ),
    BoardingModel(
      image: Assets.imagesPref3,
      title: 'All In One Place',
      body:
          '"Access it online while you travel, anywhere, anytime. Your Plans are always there, accessible from any mobile phone, tablet Learn From Other Travelers."',
    ),
  ];

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
    final textTheme = getThemeData[AppTheme.lightTheme]!.textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {
              submit();
            },
            child: Text(
              isLast ? '' : 'skip',
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
                                navigateAndFinish(context, const HomeScreen());
                              },
                              text: 'Enter',
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
                              text: 'Next',
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
