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

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isLight ? Colors.white : Colors.grey.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade400, width: 0.5),
        ),
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
    );
  }
}
