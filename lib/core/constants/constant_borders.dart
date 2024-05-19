import 'package:flutter/material.dart';

List<BoxShadow> kShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    // spreadRadius: 5,
    blurRadius: 2,
    offset: const Offset(0, 5), // changes position of shadow
  ),
];

BorderRadius kRadiusBorder = const BorderRadius.all(
  Radius.circular(4.0),
);

UnderlineInputBorder kAppBarBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    color: Colors.grey.withOpacity(0.4),
  ),
);

BoxShadow shadow = BoxShadow(
  color: Colors.grey.withOpacity(0.3),
  spreadRadius: 2,
  blurRadius: 5,
  offset: const Offset(0, 3), // changes position of shadow
);

OutlineInputBorder getBorderStyle(
    Color color, double borderWidth, double? borderRadius) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(borderRadius ?? 10.0),
    ),
    borderSide: BorderSide(color: color, width: borderWidth),
  );
}
