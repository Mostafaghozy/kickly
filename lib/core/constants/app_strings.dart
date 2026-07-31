import 'package:flutter/material.dart';

class AppStrings {
  static Text logoText({Color? color, double? size}) => Text(
    "Hungry?",
    style: TextStyle(
      fontSize: size ?? 50,
      color: color ?? Colors.white,
      fontFamily: "LuckiestGuy",
    ),
  );
}
