import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboar/core/cubit/laboarCubit/laboar_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaboarCubit extends Cubit<LaboarState> {
  LaboarCubit() : super(LaboarInitialState());

  static LaboarCubit get(context) => BlocProvider.of(context);

  String currentLanguage = 'en';

  void changeLanguage(String newLanguage) async {
    emit(LaboarChangeLanguageLoadingState());
    final pref = await SharedPreferences.getInstance();
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    pref.setString("Lang", currentLanguage).then((value) {
      emit(LaboarChangeLanguageSuccessState());
      if (kDebugMode) {
        print('currentLanguage === $currentLanguage');
      }
    }).catchError((error) {
      emit(LaboarChangeLanguageErrorState());
    });
  }
}
