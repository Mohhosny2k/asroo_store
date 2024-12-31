import 'package:asroo_store/core/service/shared_pref/pref_keys.dart';
import 'package:asroo_store/core/service/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.dart';
//part '../cubit/app_cubit.freezed.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());
  bool isDark = true;
  String currentLanguageCode = 'en';

  // theme mode change
  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppState.themeChangeMode(isDark: isDark));
    } else {
      // final isDark = state.maybeWhen(
      //   themeChangeMode: (isDark) => isDark,
      //   orElse: () => false,
      // );
      isDark = !isDark;
      await SharedPref().setBoolean(PrefKeys.themeMode, isDark).then((value) {
        emit(AppState.themeChangeMode(isDark: !isDark));
      });
    }
  }

  // language change
  void getSavedLanguage() {
    final result = SharedPref().containPreference(PrefKeys.language)
        ? SharedPref().getString(PrefKeys.language)
        : 'en';
    currentLanguageCode = result!;
    emit(AppState.languageChange(locale: Locale(currentLanguageCode)));
  }

  Future<void> _changeLang(String langCode) async {
    await SharedPref().setString(PrefKeys.language, langCode);
    currentLanguageCode = langCode;
    emit(AppState.languageChange(locale: Locale(currentLanguageCode)));
  }

  void toArabic() => _changeLang('ar');
  void toEnglish() => _changeLang('en');
}
