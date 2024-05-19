import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/constant_colors.dart';
import 'theme_state.dart';

class ThemeController extends Cubit<ThemeState> {
  ThemeController() : super(ThemeControllerInit()) {
    themeMode = getCachedThemeMode();
  }
  static ThemeController of(context) => BlocProvider.of(context);

  ThemeMode themeMode = ThemeMode.system;
  Box userBox = Hive.box("user");
  void changeThemeMode(ThemeMode themeMode) async {
    this.themeMode = themeMode;
    kBackgroundColor = themeMode == ThemeMode.dark
        ? kDarkBackgroundColor
        : kLightBackgroundColor;
    await userBox.put("themeMode", themeMode.index);
    emit(ThemeControllerInit());
  }

  bool get isDark => themeMode == ThemeMode.dark;

  ThemeMode getCachedThemeMode() {
    int? themeModeIndex = userBox.get(
      "themeMode",
    );
    if (kDebugMode) {
      print(themeModeIndex);
    }
    if (themeModeIndex == null) return ThemeMode.dark;
    return ThemeMode.values[themeModeIndex];
  }
}
