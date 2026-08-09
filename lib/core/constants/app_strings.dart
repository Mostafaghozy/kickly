import 'package:flutter/material.dart';

class AppStrings {
  static Text logoText({Color? color, double? size}) => Text(
    "KICKLY",
    style: TextStyle(
      fontSize: size ?? 50,
      color: color ?? Colors.white,
      fontFamily: "Mulish-Bold.ttf",
    ),
  );
}
