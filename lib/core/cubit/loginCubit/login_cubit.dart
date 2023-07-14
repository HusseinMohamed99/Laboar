import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboar/core/cubit/loginCubit/login_state.dart';
import 'package:laboar/generated/assets.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  String suffix = Assets.imagesEye;
  bool isPassword = true;

  void showPassword() {
    isPassword = !isPassword;
    suffix = isPassword ? Assets.imagesEye : Assets.imagesHide;

    emit(ChangePasswordLoginState());
  }
}
