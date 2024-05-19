import 'package:flutter/material.dart';

import '../../main.dart';
import '../theme/theme_controller.dart';

const Color kPrimaryColor = Color(0xFF7177BE);

const Color kFontColor = Colors.white;
const Color kFontSecondaryColor = Color(0xFF445462);
Color kBackgroundColor = () {
  try {
    return ThemeController.of(navigatorKey.currentContext!).themeMode ==
            ThemeMode.dark
        ? kDarkBackgroundColor
        : kLightBackgroundColor;
  } catch (e) {
    return kDarkBackgroundColor;
  }
}();
const Color kDarkBackgroundColor = Color(0xFF0D0D0D);

const Color kDarkBlackBackgroundColor = Colors.black;
const Color kLightBackgroundColor = Colors.white;
const Color kLightTextColor = Color(0xFF0D0F11);
const Color kGreyTitleTextColor = Color(0xFF999999);
const Color kGreyBGColor = Color(0xFF232222);
const Color kGreyBorderColor = Color(0xFF707070);
const Color kDarkGreyColor = Color(0xFF707070);
const Color kOffWhiteColor = Color(0xFFF1F1F1);
const Color kOBlack80 = Color(0xFF191919);
const Color purpleBlack = Color(0x0033343A);
const Color kShimmerColor = Color(0xFF1A1A1A);
const kGradientColor = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xFF8A1539),
    Color(0xFFF63D4A),
  ],
);
const Color kRedColor = Color(0xFF5C1D21);
