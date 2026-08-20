import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/shared/custom_text.dart';

class SportChip extends StatelessWidget {
  final String title;
  final String? icon;
  final VoidCallback? onTap;

  const SportChip({super.key, required this.title, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey
                  : Colors.black,
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) Text(icon!, style: const TextStyle(fontSize: 12)),
            if (icon != null) const Gap(15),
            CustomText(
              text: title,
              size: 12,
              weight: FontWeight.w600,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
