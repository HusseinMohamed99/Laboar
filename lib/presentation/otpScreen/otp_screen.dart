import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laboar/core/components/buttons.dart';
import 'package:laboar/core/components/navigator.dart';
import 'package:laboar/core/components/size_box.dart';
import 'package:laboar/core/cubit/laboarCubit/laboar_cubit.dart';
import 'package:laboar/core/global/theme/app_color/app_color_light.dart';
import 'package:laboar/core/global/theme/theme_data/theme_data.dart';
import 'package:laboar/core/utils/enum.dart';
import 'package:laboar/generated/assets.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    var localizations = AppLocalizations.of(context)!;
    final textTheme = getThemeData[AppTheme.lightTheme]!.textTheme;
    int start = 30;
    return Scaffold(
      backgroundColor: AppColorsLight.lightSecondaryColor,
      appBar: AppBar(
        toolbarHeight: 28.h,
        leading: defaultIconButton(
          function: () {
            pop(context);
          },
          image: LaboarCubit.get(context).currentLanguage == 'en'
              ? Assets.imagesArrowLeft
              : Assets.assetsArrowRight,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        localizations.otp,
                        style: textTheme.bodyMedium,
                      ),
                      Space(height: 10.h, width: 0),
                      Text(
                        localizations.hintOtp,
                        textAlign: TextAlign.center,
                        style: textTheme.titleMedium!.copyWith(
                          color: AppColorsLight.greyColor,
                        ),
                      ),
                      Space(height: 10.h, width: 0),
                      Text(
                        '(+02) 01022731520',
                        textAlign: TextAlign.center,
                        style: textTheme.titleMedium!.copyWith(
                          color: AppColorsLight.lightThirdColor,
                        ),
                      ),
                    ],
                  ),
                ),
                otpField(context),
                Space(height: 38.h, width: 0),
                defaultMaterialButton(
                  function: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  text: localizations.submit,
                ),
                Space(height: 38.h, width: 0),
                SizedBox(
                  width: 321,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Code Sent. Resend Code in ',
                          style: textTheme.titleMedium!.copyWith(
                            color: AppColorsLight.greyColor,
                          ),
                        ),
                        TextSpan(
                          text: '00:$start',
                          style: textTheme.titleMedium!.copyWith(
                            color: AppColorsLight.lightThirdColor,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget otpField(BuildContext context) {
    final textTheme = getThemeData[AppTheme.lightTheme]!.textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 18, top: 40).r,
      child: OTPTextField(
        length: 4,
        width: double.infinity,
        fieldWidth: 48.w,
        otpFieldStyle: OtpFieldStyle(
          backgroundColor: AppColorsLight.fillColor,
          borderColor: AppColorsLight.greyColor,
          focusBorderColor: AppColorsLight.lightPrimaryColor,
          enabledBorderColor: AppColorsLight.greyColor,
          disabledBorderColor: AppColorsLight.lightPrimaryColor,
        ),
        style: textTheme.labelLarge!,
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldStyle: FieldStyle.box,
        contentPadding: const EdgeInsets.symmetric(vertical: 18).r,
        // onCompleted: (pin) {
        //   print("Completed: " + pin);
        //   setState(() {
        //     smsCode = pin;
        //   });
        // },
        onChanged: (pin) {
          if (kDebugMode) {
            print("Completed: $pin");
          }
          // setState(() {
          //   smsCode = pin;
          // });
        },
      ),
    );
  }

  void startTimer() {
    int start = 50;
    const sec = Duration(seconds: 1);
    Timer.periodic(sec, (timer) {
      if (start == 0) {
        // setState(() {
        timer.cancel();
        //   wait = false;
        // });
      } else {
        // setState(() {
        start--;
        // });
      }
    });
  }

  void setData(String verificationId) {
    // setState(() {
    //   verificationIdFinal = verificationId;
    // });
    startTimer();
  }
}
