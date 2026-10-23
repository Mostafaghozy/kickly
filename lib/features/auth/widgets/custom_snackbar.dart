import 'package:flutter/material.dart';

class CustomSnackBar {
  CustomSnackBar._();

  // Success SnackBar
  static void showSuccess(
    BuildContext context, {
    required String message,
    String title = 'Success!',
    Duration duration = const Duration(seconds: 3),
  }) {
    _show(
      context,
      title: title,
      message: message,
      duration: duration,
      backgroundColor: const Color(0xFF172B25),
      borderColor: const Color(0xFF315343),
      icon: Icons.check_circle_rounded,
      iconColor: const Color(0xFF8BE0B0),
      messageColor: const Color(0xFFC4D8CC),
    );
  }

  // Error SnackBar
  static void showError(
    BuildContext context, {
    required String message,
    String title = 'Something went wrong',
    Duration duration = const Duration(seconds: 4),
  }) {
    _show(
      context,
      title: title,
      message: message,
      duration: duration,
      backgroundColor: const Color(0xFF351D22),
      borderColor: const Color(0xFF79343D),
      icon: Icons.error_outline_rounded,
      iconColor: const Color(0xFFFF8585),
      messageColor: const Color(0xFFFFD6D6),
    );
  }

  // Shared SnackBar UI
  static void _show(
    BuildContext context, {
    required String title,
    required String message,
    required Duration duration,
    required Color backgroundColor,
    required Color borderColor,
    required IconData icon,
    required Color iconColor,
    required Color messageColor,
  }) {
    final messenger = ScaffoldMessenger.of(context);

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
          padding: EdgeInsets.zero,
          duration: duration,
          dismissDirection: DismissDirection.horizontal,
          content: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 450),
            curve: Curves.easeOutBack,
            builder: (context, value, child) {
              return Opacity(
                opacity: value.clamp(0.0, 1.0),
                child: Transform.translate(
                  offset: Offset(0, 25 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: iconColor.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: iconColor, size: 25),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          message,
                          style: TextStyle(
                            color: messageColor,
                            fontSize: 13,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.close_rounded,
                    color: messageColor.withValues(alpha: 0.7),
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
