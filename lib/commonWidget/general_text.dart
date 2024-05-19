import 'package:flutter/material.dart';
import 'package:simple_app/core/extensions/buildcontext_extensions.dart';

import '../core/constants/constant_colors.dart';
import '../core/helper/size_config.dart';
import '../core/theme/theme_controller.dart';

class GeneralText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final bool isBold;
  final FontWeight? fontWeight;
  final double margin;

  final TextDecoration textDecoration;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextOverflow? overflow;

  const GeneralText({
    Key? key,
    required this.text,
    this.size = 14,
    this.margin = 0,
    this.color,
    this.isBold = false,
    this.textDecoration = TextDecoration.none,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.overflow,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: getProportionateScreenWidth(margin)),
      child: Text(
        text,
        style: TextStyle(
          fontWeight:
              fontWeight ?? (isBold ? FontWeight.bold : FontWeight.normal),
          fontSize: getProportionateScreenWidth(size),
          color: color ??
              (ThemeController.of(context).themeMode == ThemeMode.dark
                  ? kOffWhiteColor
                  : kLightTextColor),
          decoration: textDecoration,
        ),
        textAlign: textAlign,
        textDirection:
            (context.isArabic ? TextDirection.rtl : TextDirection.ltr),
        overflow: overflow,
      ),
    );
  }
}
