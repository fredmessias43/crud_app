import 'package:crud_app/src/core/themes/colors.dart';
import 'package:crud_app/src/core/themes/default/colors/dark_colors.dart';
import 'package:crud_app/src/core/themes/default/colors/light_colors.dart';
import 'package:crud_app/src/core/themes/default/theme_data.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static Brightness brightness = Brightness.light;

  AppTheme({Brightness? brightness}) {
    brightness = brightness ?? Brightness.light;
  }

  static bool isDark() => brightness == Brightness.dark;

  static void toggleBrightness() {
    brightness = brightness == Brightness.light ? Brightness.dark : Brightness.light;
  }

  static AppColors get currentColors {
    return switch (brightness) {
      Brightness.light => lightThemeColors,
      Brightness.dark => darkThemeColors,
    };
  }

  static ThemeData get currentThemeData {
    return defaultThemeData;
  }
}
