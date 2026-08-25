import 'package:flutter/material.dart';
import 'package:kickly/shared/custom_text.dart';

class CustomRate extends StatelessWidget {
  const CustomRate({super.key, required this.rate});
  final String rate;

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isLight ? Color(0xffD9D9D9) : Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: CustomText(
        text: "⭐ $rate",
        color: isLight ? Colors.black : Colors.white,
        size: 12,
      ),
    );
  }
}
