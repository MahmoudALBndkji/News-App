import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/themeModeState.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class ThemeModeCubit extends Cubit<ThemeModeStates> {
  ThemeModeCubit() : super(ThemeModeInitialState());

  static ThemeModeCubit get(context) => BlocProvider.of(context);
  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
      emit(AppChangeModeState());
    }
  }
}
