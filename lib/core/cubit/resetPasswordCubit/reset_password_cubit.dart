import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboar/core/cubit/resetPasswordCubit/reset_password_state.dart';
import 'package:laboar/generated/assets.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit() : super(ResetPasswordInitialState());

  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  String suffix = Assets.imagesEye;
  bool isPassword = true;

  void showPassword() {
    isPassword = !isPassword;
    suffix = isPassword ? Assets.imagesEye : Assets.imagesHide;

    emit(ChangePasswordResetPasswordState());
  }

  String suffixImage = Assets.imagesEye;
  bool isConfirmPassword = true;

  void showConfirmPassword() {
    isConfirmPassword = !isConfirmPassword;
    suffixImage = isConfirmPassword ? Assets.imagesEye : Assets.imagesHide;

    emit(ChangePasswordResetPasswordState());
  }
}
