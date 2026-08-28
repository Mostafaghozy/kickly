import 'package:flutter/material.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/shared/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.label});

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: CustomText(text: label, color: AppColors.darkText),
      ),
    );
  }
}
