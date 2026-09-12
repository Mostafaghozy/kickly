import 'package:flutter/material.dart';
import 'package:kickly/shared/custom_text.dart';

class FieldLabel extends StatelessWidget {
  final String text;
  final double? size;

  const FieldLabel(this.text, {super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text,
      size: size ?? 14,
      weight: FontWeight.w600,
      color: Colors.black,
    );
  }
}
