import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laboar/core/components/buttons.dart';
import 'package:laboar/core/components/navigator.dart';
import 'package:laboar/core/components/size_box.dart';
import 'package:laboar/core/components/text_form_field.dart';
import 'package:laboar/core/cubit/laboarCubit/laboar_cubit.dart';
import 'package:laboar/core/cubit/resetPasswordCubit/reset_password_cubit.dart';
import 'package:laboar/core/cubit/resetPasswordCubit/reset_password_state.dart';
import 'package:laboar/core/global/theme/app_color/app_color_light.dart';
import 'package:laboar/core/global/theme/theme_data/theme_data.dart';
import 'package:laboar/core/utils/enum.dart';
import 'package:laboar/generated/assets.dart';
import 'package:laboar/presentation/forgetPasswordScreen/forget_password_screen.dart';

class ResetScreen extends StatelessWidget {
  const ResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();

    var localizations = AppLocalizations.of(context)!;
    final textTheme = getThemeData[AppTheme.lightTheme]!.textTheme;
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
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
                              localizations.resetPassword,
                              style: textTheme.bodyMedium,
                            ),
                            Space(height: 10.h, width: 0),
                            Text(
                              localizations.hintPassword,
                              textAlign: TextAlign.center,
                              style: textTheme.titleMedium!.copyWith(
                                color: AppColorsLight.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 18, top: 40).r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              localizations.password,
                              style: textTheme.labelMedium,
                            ),
                            DefaultTextFormField(
                              obscuringCharacter: '*',
                              context: context,
                              controller: confirmPasswordController,
                              keyboardType: TextInputType.visiblePassword,
                              validate: (String? value) {
                                if (value!.trim().isEmpty ||
                                    value.length == 11) {
                                  return localizations.password;
                                }
                                return null;
                              },
                              isPassword:
                                  ResetPasswordCubit.get(context).isPassword,
                              suffixPressed: () {
                                ResetPasswordCubit.get(context).showPassword();
                              },
                              suffixImage:
                                  ResetPasswordCubit.get(context).suffix,
                              hint: localizations.enterPassword,
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
                              localizations.confirmPassword,
                              style: textTheme.labelMedium,
                            ),
                            DefaultTextFormField(
                              obscuringCharacter: '*',
                              context: context,
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              validate: (String? value) {
                                if (value!.trim().isEmpty || value.length < 8) {
                                  return localizations.confirmPassword;
                                }
                                return null;
                              },
                              hint: localizations.enterConfirmPassword,
                              isPassword: ResetPasswordCubit.get(context)
                                  .isConfirmPassword,
                              suffixPressed: () {
                                ResetPasswordCubit.get(context)
                                    .showConfirmPassword();
                              },
                              suffixImage:
                                  ResetPasswordCubit.get(context).suffixImage,
                            ),
                          ],
                        ),
                      ),
                      defaultMaterialButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            navigateTo(context, const ForgetPasswordScreen());
                          }
                        },
                        text: localizations.savePassword,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
