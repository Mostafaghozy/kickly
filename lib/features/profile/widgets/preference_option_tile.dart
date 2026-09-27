import 'package:flutter/material.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/shared/custom_text.dart';

enum PreferenceTrailing { switchButton, dropdown, arrow }

class PreferenceOptionTile extends StatelessWidget {
  const PreferenceOptionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.trailing,
    this.value = false,
    this.onChanged,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final PreferenceTrailing trailing;

  final bool value;
  final ValueChanged<bool>? onChanged;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 14),
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
            Icon(icon, size: 20, color: Colors.black),

            const SizedBox(width: 10),

            Expanded(
              child: CustomText(
                text: title,
                size: 14,
                weight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            _buildTrailing(),
          ],
        ),
      ),
    );
  }

  Widget _buildTrailing() {
    switch (trailing) {
      case PreferenceTrailing.switchButton:
        return SizedBox(
          width: 38,
          height: 24,
          child: FittedBox(
            child: Switch(
              value: value,
              onChanged: onChanged,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeTrackColor: AppColors.primary,
              inactiveTrackColor: Color(0xffADAEBC),
              inactiveThumbColor: Colors.white,
            ),
          ),
        );

      case PreferenceTrailing.dropdown:
        return const Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 22,
          color: Colors.black,
        );

      case PreferenceTrailing.arrow:
        return const Icon(
          Icons.chevron_right_rounded,
          size: 21,
          color: Colors.black,
        );
    }
  }
}
