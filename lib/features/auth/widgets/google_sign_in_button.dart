import 'package:flutter/material.dart';
import 'package:kickly/shared/custom_text.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String image;
  final String txt;

  const GoogleSignInButton({
    super.key,
    required this.onPressed,
    required this.image,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white, width: 1.5),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            const SizedBox(width: 50),
            CustomText(text: txt, weight: FontWeight.w700, size: 14),
          ],
        ),
      ),
    );
  }
}
