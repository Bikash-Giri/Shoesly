import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/resources/src/theme.dart'; // ignore: import_of_legacy_library_into_null_safe

class ThemeBloc extends Cubit<ShoeslyTheme> {
  ThemeBloc({ThemeMode themeMode = ThemeMode.light})
      : super(ShoeslyTheme(themeMode: themeMode)) {
    SchedulerBinding.instance.platformDispatcher.onPlatformBrightnessChanged =
        () {
      if (state.themeMode == ThemeMode.system) addThemeMode(ThemeMode.system);
    };
  }

  void addThemeMode(ThemeMode mode) {
    emit(ShoeslyTheme(
      themeMode: mode,
      statusBarColor: state.statusBarColor,
      typographySize: state.typographySize,
    ));
  }

  void updateLocale(Locale locale) {
    emit(ShoeslyTheme(
      themeMode: state.themeMode,
      statusBarColor: state.statusBarColor,
      typographySize: state.typographySize,
    ));
  }

  ThemeMode themeModeFromRawValue(String? rawThemeMode) {
    switch (rawThemeMode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
    }
    return ThemeMode.system;
  }
}

extension ThemeBlocExtension on BuildContext {
  ShoeslyTheme get shoeslyTheme => BlocProvider.of<ThemeBloc>(this).state;

  ThemeData get theme => shoeslyTheme.themeData;

  TextTheme get textTheme => theme.textTheme;

  ShoeslyThemeColor get color => shoeslyTheme.color;
}
