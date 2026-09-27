import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/shared/custom_text.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
    required this.txt,
    required this.onPressed,
    this.color,
    this.backgroundColor,
    this.icon,
  });

  final String txt;
  final VoidCallback onPressed;
  final Color? color;
  final Color? backgroundColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white,
          foregroundColor: color ?? Colors.black,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          children: [
            Icon(icon),
            Gap(120),
            CustomText(
              text: txt,
              size: 15,
              weight: FontWeight.w800,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
