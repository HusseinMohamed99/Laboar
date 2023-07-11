import 'package:laboar/core/components/navigator.dart';
import 'package:laboar/core/network/cache_helper.dart';
import 'package:laboar/presentation/on_boarding/on_boarding_screen.dart';

void logOut(context) {
  CacheHelper.removeData(
    key: 'uId',
  ).then((value) {
    if (value) {
      navigateAndFinish(context, const OnBoardingScreen());
    }
  });
}
