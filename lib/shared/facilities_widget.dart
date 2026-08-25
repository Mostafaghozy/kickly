import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/shared/custom_text.dart';

class FacilitiesChip extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;
  final Color? color;

  const FacilitiesChip({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 166,
        height: 42,
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isLight ? Colors.grey : Colors.black,
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Icon on the left
            if (icon != null)
              Positioned(
                left: 15,
                child: Icon(icon, size: 20, color: Colors.white),
              ),

            // Text exactly centered
            Center(
              child: CustomText(
                text: title,
                size: 15,
                weight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
