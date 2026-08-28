import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/shared/custom_text.dart';

class SportChip extends StatelessWidget {
  final String title;
  final String? icon;
  final IconData? icons;
  final VoidCallback? onTap;

  const SportChip({
    super.key,
    required this.title,
    this.icon,
    this.icons,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: isLight ? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isLight
                  ? Colors.grey.withOpacity(0.80)
                  : Colors.black.withOpacity(0.80),
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
              color: isLight ? Colors.black : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
