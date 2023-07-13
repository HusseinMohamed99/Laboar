import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboar/core/cubit/laboarCubit/laboar_state.dart';
import 'package:laboar/core/network/cache_helper.dart';

class LaboarCubit extends Cubit<LaboarState> {
  LaboarCubit() : super(LaboarInitialState());

  static LaboarCubit get(context) => BlocProvider.of(context);

  String currentLanguage = 'en';

  void changeLanguage(String newLanguage) async {
    emit(LaboarChangeLanguageLoadingState());
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    CacheHelper.saveData(key: 'Lang', value: currentLanguage).then((value) {
      emit(LaboarChangeLanguageSuccessState());
      if (kDebugMode) {
        print('currentLanguage === $currentLanguage');
      }
    }).catchError((error) {
      emit(LaboarChangeLanguageErrorState());
    });
  }

  bool isCheck = false;
  void boxCheck(bool newCheck) async {
    emit(LaboarChangeValueLoadingState());
    if (isCheck == newCheck) return;
    isCheck = newCheck;
    CacheHelper.saveData(key: 'check', value: isCheck).then((value) {
      emit(LaboarChangeValueSuccessState());
      if (kDebugMode) {
        print('isCheck === $isCheck');
      }
    }).catchError((error) {
      emit(LaboarChangeValueErrorState());
    });
  }
}
