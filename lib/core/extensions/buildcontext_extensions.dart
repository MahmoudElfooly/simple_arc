import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  bool get isEnglish {
    return locale.toString() == "en" ;
  }

  bool get isArabic {
    return locale.toString() == "ar" ;
  }
}