import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laboar/core/components/size_box.dart';
import 'package:laboar/core/network/cache_helper.dart';
import 'package:laboar/generated/assets.dart';
import 'package:laboar/model/on_board_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PrefScreen extends StatefulWidget {
  const PrefScreen({Key? key}) : super(key: key);

  @override
  State<PrefScreen> createState() => _PrefScreenState();
}

class _PrefScreenState extends State<PrefScreen> {
  var pageController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: Assets.imagesPref1,
      title:
          'Find all your house needs in one place.  We provide every service to make your home experience smooth.',
    ),
    BoardingModel(
      image: Assets.imagesPref2,
      title:
          'We have the best in class individuals working just for you. They are well  trained and capable of handling anything you need.',
    ),
    BoardingModel(
      image: Assets.imagesPref3,
      title:
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
        // navigateAndFinish(context, routeName: OnBoard.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
            child: Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  submit();
                },
                child: Text(
                  isLast ? '' : 'skip',
                  style: GoogleFonts.poppins(
                    // color: ThemeApp.primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),

                  // style: TextStyle(

                  // ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
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
                          });
                        } else {
                          setState(() {
                            isLast = false;
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
                      InkWell(
                        onTap: () {
                          if (isLast) {
                            submit();
                          } else {
                            pageController.nextPage(
                              duration: const Duration(
                                milliseconds: 780,
                              ),
                              curve: Curves.ease,
                            );
                          }
                        },
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                    horizontal: 35, vertical: 12)
                                .r,
                            width: 163,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(15).r),
                              // color: ThemeApp.primaryColor,
                            ),
                            child: FittedBox(
                              child: Text(
                                isLast ? "Get Started" : 'Next',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Space(height: 40.h, width: 0),
                      SmoothPageIndicator(
                        textDirection: TextDirection.ltr,
                        controller: pageController,
                        count: boarding.length,
                        effect: const ExpandingDotsEffect(
                          dotWidth: 12.0,
                          dotHeight: 12.0,
                          dotColor: Colors.grey,
                          //    activeDotColor: ThemeApp.primaryColor,
                          radius: 20.0,
                          spacing: 17,
                          expansionFactor: 1.01,
                        ),
                      ),
                      Space(height: 48.h, width: 0),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              model.image,
              fit: BoxFit.fill,
              height: 300,
            ),
            Space(height: 10.h, width: 0),
            Text(
              model.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(
                fontSize: 16.sp,
                //    color: ThemeApp.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
}
