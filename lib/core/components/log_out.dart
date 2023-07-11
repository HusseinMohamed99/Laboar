import 'package:laboar/core/components/navigator.dart';
import 'package:laboar/core/network/cache_helper.dart';

void logOut(context) {
  CacheHelper.removeData(
    key: 'uId',
  ).then((value) {
    if (value) {
      navigateAndFinish(
        context,
        routeName: '',
      );
    }
  });
}
