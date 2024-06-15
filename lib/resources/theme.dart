import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
part 'colors.dart';

part 'typography.dart';

class ShoeslyTheme {
  final ThemeMode themeMode;
  final Color statusBarColor;
  final ShoeslyThemeColor color;
  final ThemeData themeData;
  final TypographySize typographySize;

  ShoeslyTheme({
    required this.themeMode,
    this.statusBarColor = Colors.transparent,
    this.typographySize = TypographySize.normal,
  })  : color = _color(themeMode),
        themeData = _themeData(themeMode, _color(themeMode), typographySize);

  static bool isDarkMode(ThemeMode mode) {
    final isSystemDarkMode =
        SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    return mode == ThemeMode.dark ||
        (mode == ThemeMode.system && isSystemDarkMode);
  }

  static ThemeData _themeData(
    ThemeMode themeMode,
    ShoeslyThemeColor color,
    TypographySize size,
  ) {
    return _lightTheme(color, 'inter', size);
  }

  // TODO: Use dark variant when available
  static ShoeslyThemeColor _color(ThemeMode themeMode) {
    return const ShoeslyThemeColor(
        primary: _primaryColorLight,
        success: _successColorLight,
        warning: _successColorLight,
        secondary: _secondaryColorLight,
        information: _secondaryColorLight,
        brand: _successColorLight,
        error: _errorColorLight);
  }
  //
  // // TODO(sarbagya): Use InkSparkle everywhere once the issue is resolved https://github.com/flutter/flutter/issues/85238
  // static InteractiveInkFeatureFactory splashFactory =
  //     kIsWeb ? InkRipple.splashFactory : InkSparkle.splashFactory;

  @override
  String toString() => 'KhaltiTheme(color: $color, isDarkMode: $isDarkMode)';
}

// PageTransitionsTheme get _pageTransitionTheme {
//   return const PageTransitionsTheme(
//     builders: {
//       TargetPlatform.android:
//           KhaltiTransitionsBuilder.scaled(fillColor: Colors.transparent),
//       TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//       TargetPlatform.linux: KhaltiTransitionsBuilder.none(),
//       TargetPlatform.windows: KhaltiTransitionsBuilder.none(),
//       TargetPlatform.macOS: KhaltiTransitionsBuilder.none(),
//       TargetPlatform.fuchsia: KhaltiTransitionsBuilder.none(),
//     },
//   );
// }

ThemeData _lightTheme(ShoeslyThemeColor color, String? fontFamily,
    TypographySize typographySize) {
  final textTheme = _getShoeslyTextTheme(typographySize).apply(
    displayColor: _successColorLight,
    bodyColor: _successColorDark,
    fontFamily: fontFamily,
  );
  return ThemeData.from(
    colorScheme: _colorScheme(),
    textTheme: textTheme,
    // TODO(All): Update theme data to make use of material 3
    useMaterial3: false,
  ).copyWith(
    primaryColorDark: _primaryColorLight,
    // inputDecorationTheme: _inputDecorationTheme(textTheme, color),
    indicatorColor: _primaryColorLight,
    // tabBarTheme: _tabBarTheme(textTheme, color),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: _primaryColorLight,
      selectionHandleColor: _primaryColorLight,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _primaryColorLight,
      foregroundColor: Colors.white,
    ),
    // hoverColor: _surfaceColorLight.withOpacity(0.035),
    splashColor: _primaryColorLight.withAlpha(80),
    // The color is in AARRBBGG order of _primaryColorLight.
    highlightColor: _primaryColorLight.withAlpha(20),
    // snackBarTheme: SnackBarThemeData(
    //   shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(d_borderRadius)),
    //   backgroundColor: _surfaceColorLight.shade400,
    //   behavior: SnackBarBehavior.floating,
    //   contentTextStyle:
    //       textTheme.bodyMedium?.copyWith(color: Colors.white, height: 1.5),
    //   actionTextColor: Colors.white,
    // ),
    // scrollbarTheme: ScrollbarThemeData(
    //     thumbColor: MaterialStateProperty.all(_primaryColorLight.shade300)),
    // pageTransitionsTheme: _pageTransitionTheme,
    // splashFactory: KhaltiTheme.splashFactory,
  );
}

// ThemeData _darkTheme(
//     KhaltiThemeColor color, String? fontFamily, TypographySize typographySize) {
//   final textTheme = _getKhaltiTextTheme(typographySize).apply(
//     displayColor: _surfaceColorDark,
//     bodyColor: _surfaceColorDark,
//     fontFamily: fontFamily,
//   );
//   return ThemeData.from(
//     colorScheme: _colorScheme(isDark: true),
//     textTheme: textTheme,
//     // TODO(All): Update theme data to make use of material 3
//     useMaterial3: false,
//   ).copyWith(
//     primaryColorDark: _primaryColorDark,
//     inputDecorationTheme: _inputDecorationTheme(textTheme, color),
//     indicatorColor: _primaryColorDark,
//     tabBarTheme: _tabBarTheme(textTheme, color),
//     textSelectionTheme: const TextSelectionThemeData(
//       cursorColor: _primaryColorDark,
//       selectionHandleColor: _primaryColorDark,
//     ),
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: _primaryColorDark,
//       foregroundColor: Colors.white,
//     ),
//     hoverColor: _surfaceColorDark.withOpacity(0.035),
//     splashColor: _primaryColorDark.withAlpha(30),
//     highlightColor: _primaryColorDark.withAlpha(20),
//     snackBarTheme: SnackBarThemeData(
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(d_borderRadius)),
//       backgroundColor: _surfaceColorDark.shade10,
//       behavior: SnackBarBehavior.floating,
//       contentTextStyle: textTheme.bodyMedium!.copyWith(height: 1.5),
//       actionTextColor: Colors.white,
//     ),
//     scrollbarTheme: ScrollbarThemeData(
//         thumbColor: MaterialStateProperty.all(
//       _primaryColorLight.shade300,
//     )),
//     pageTransitionsTheme: _pageTransitionTheme,
//     splashFactory: KhaltiTheme.splashFactory,
//   );
// }

ColorScheme _colorScheme() {
  return const ColorScheme.light(
    primary: _primaryColorLight,
    error: _errorColorLight,
  );
}

// InputDecorationTheme _inputDecorationTheme(
//     TextTheme textTheme, KhaltiThemeColor color) {
//   final baseBorder = OutlineInputBorder(
//     borderRadius: const BorderRadius.all(Radius.circular(6)),
//     borderSide:
//         BorderSide(color: color.surface.shade20, width: d_normalBorderWidth),
//   );
//
//   return InputDecorationTheme(
//     labelStyle: textTheme.fieldLabel.copyWith(color: color.surface.shade100),
//     hintStyle: textTheme.bodySmall?.copyWith(color: color.surface.shade100),
//     helperStyle: textTheme.bodySmall
//         ?.copyWith(color: color.surface.shade50, fontSize: 12, height: 1),
//     prefixStyle: textTheme.bodyMedium?.copyWith(color: color.surface.shade50),
//     errorStyle: textTheme.labelSmall
//         ?.copyWith(color: color.error, fontSize: 12, height: 1),
//     enabledBorder: baseBorder,
//     errorBorder:
//         baseBorder.copyWith(borderSide: BorderSide(color: color.error)),
//     focusedBorder: baseBorder.copyWith(
//         borderSide:
//             BorderSide(color: color.primary, width: d_activeBorderWidth)),
//     focusedErrorBorder: baseBorder.copyWith(
//         borderSide: BorderSide(color: color.error, width: d_activeBorderWidth)),
//     contentPadding: EdgeInsets.zero,
//   );
// }
//
// TabBarTheme _tabBarTheme(TextTheme textTheme, KhaltiThemeColor color) {
//   return TabBarTheme(
//     unselectedLabelColor: _surfaceColorLight.shade50,
//     unselectedLabelStyle: textTheme.titleSmall?.copyWith(
//       color: color.surface.shade100,
//     ),
//     labelStyle: textTheme.titleSmall,
//     labelColor: color.primary,
//   );
// }

class ShoeslyThemeColor {
  final ShoeslyColor primary;
  final ShoeslyColor secondary;
  final ShoeslyColor brand;
  final ShoeslyColor error;
  final ShoeslyColor success;
  final ShoeslyColor information;
  final ShoeslyColor warning;

  const ShoeslyThemeColor({
    required this.primary,
    required this.secondary,
    required this.error,
    required this.success,
    required this.brand,
    required this.information,
    required this.warning,
  });

  @override
  String toString() =>
      'ShoeslyColor(primary: $primary, brand:$brand,information:$information,warning:$warning, secondary: $secondary,'
      ' error: $error, success: $success,)';
}
