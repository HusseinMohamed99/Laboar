import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laboar/core/components/buttons.dart';
import 'package:laboar/core/components/on_tap_function.dart';
import 'package:laboar/core/components/size_box.dart';
import 'package:laboar/core/components/text_form_field.dart';
import 'package:laboar/core/cubit/registerCubit/register_cubit.dart';
import 'package:laboar/core/global/theme/app_color/app_color_light.dart';
import 'package:laboar/core/global/theme/theme_data/theme_data.dart';
import 'package:laboar/core/utils/enum.dart';
import 'package:laboar/generated/assets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var fullNameController = TextEditingController();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();
    var localizations = AppLocalizations.of(context)!;
    final textTheme = getThemeData[AppTheme.lightTheme]!.textTheme;
    return Scaffold(
      backgroundColor: AppColorsLight.lightSecondaryColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        localizations.signUp,
                        style: textTheme.bodyMedium,
                      ),
                      Space(height: 10.h, width: 0),
                      Text(
                        localizations.authLogin,
                        textAlign: TextAlign.center,
                        style: textTheme.titleMedium!.copyWith(
                          color: AppColorsLight.greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 18, top: 18).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localizations.fullName,
                        style: textTheme.labelMedium,
                      ),
                      DefaultTextFormField(
                        context: context,
                        controller: fullNameController,
                        keyboardType: TextInputType.name,
                        validate: (String? value) {
                          if (value!.trim().isEmpty || value.length < 3) {
                            return localizations.enterFullName;
                          }
                          return null;
                        },
                        suffix: Icons.person_outlined,
                        hint: localizations.enterFullName,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 18).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localizations.phoneNumber,
                        style: textTheme.labelMedium,
                      ),
                      DefaultTextFormField(
                        context: context,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        validate: (String? value) {
                          if (value!.trim().isEmpty || value.length == 11) {
                            return localizations.enterPhoneNumber;
                          }
                          return null;
                        },
                        suffix: Icons.person_outlined,
                        hint: localizations.enterPhoneNumber,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 38).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localizations.password,
                        style: textTheme.labelMedium,
                      ),
                      DefaultTextFormField(
                        context: context,
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validate: (String? value) {
                          if (value!.trim().isEmpty || value.length < 8) {
                            return localizations.enterPassword;
                          }
                          return null;
                        },
                        suffix: Icons.person_outlined,
                        hint: localizations.enterPassword,
                        isPassword: true,
                      ),
                    ],
                  ),
                ),
                defaultMaterialButton(
                  function: () {
                    if (formKey.currentState!.validate()) {
                      RegisterCubit.get(context).userRegister(
                        phone: phoneController.text,
                        password: passwordController.text,
                        fullName: fullNameController.text,
                      );
                    }
                  },
                  text: localizations.signUp,
                ),
                Space(height: 15.h, width: 0),
                Center(
                  child: Text(
                    localizations.or,
                    style: textTheme.labelSmall!.copyWith(
                      color: AppColorsLight.blackColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 11.0).r,
                  child: defaultButton(
                    color: const Color(0xFFF9FFF6),
                    function: () {},
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          localizations.facebook,
                          style: textTheme.labelMedium,
                        ),
                        Space(height: 0, width: 12.w),
                        SvgPicture.asset(Assets.imagesFacebook),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0).r,
                  child: defaultButton(
                    color: const Color(0xFFF9FFF6),
                    function: () {},
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          localizations.google,
                          style: textTheme.labelMedium,
                        ),
                        Space(height: 0, width: 12.w),
                        SvgPicture.asset(Assets.imagesGoogle),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      localizations.haveAccount,
                      style: textTheme.labelMedium,
                    ),
                    Space(height: 0, width: 5.w),
                    OnTapFunction(
                      function: () {
                        // navigateTo(context,
                        //     SignUpScreen());
                      },
                      child: Text(
                        localizations.signIn,
                        style: textTheme.labelMedium!.copyWith(
                          color: AppColorsLight.lightPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
