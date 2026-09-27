import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/shared/custom_text.dart';

class AccountOptionTile extends StatelessWidget {
  const AccountOptionTile({
    super.key,
    required this.widget,
    required this.title,
    this.onTap,
    this.lastWidget,
  });

  final Widget widget;
  final Widget? lastWidget;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F7),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.40),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            IconTheme(
              data: const IconThemeData(color: Colors.black),
              child: widget,
            ),

            Gap(10),

            Expanded(
              child: CustomText(
                text: title,
                size: 14,
                weight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            lastWidget ??
                const Icon(
                  Icons.chevron_right_rounded,
                  size: 20,
                  color: Colors.black,
                ),
          ],
        ),
      ),
    );
  }
}
