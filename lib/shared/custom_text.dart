import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.weight,
  });

  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    final effectiveColor =
        color ?? Theme.of(context).textTheme.bodyMedium?.color;

    return Text(
      text,
      style: TextStyle(
        color: effectiveColor,
        fontSize: size ?? 14,
        fontWeight: weight ?? FontWeight.w700,
        fontFamily: "Mulish",
      ),
    );
  }
}
