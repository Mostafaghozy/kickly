import 'package:flutter/material.dart';
import 'package:kickly/shared/custom_text.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String lightImage;
  final String darkImage;
  final String txt;

  const GoogleSignInButton({
    super.key,
    required this.onPressed,
    required this.lightImage,
    required this.darkImage,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: isLight ? Colors.white : Colors.grey.shade900,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey.shade200,
            width: isLight ? 3 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isLight
                  ? Colors.transparent.withOpacity(0.50)
                  : Colors.transparent.withOpacity(0.80),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(isLight ? lightImage : darkImage, fit: BoxFit.cover),
            const SizedBox(width: 50),
            CustomText(
              text: txt,
              weight: FontWeight.w700,
              size: 14,
              color: isLight ? Colors.black : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
