import 'package:flutter/material.dart';

class TextOnboarding extends StatelessWidget {
  const TextOnboarding({
    super.key,
    required this.txt,
    required this.description,
  });

  final String txt;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          txt,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
            fontFamily: "Mulish-Bold.ttf",
          ),
        ),
        const SizedBox(height: 12),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 15,
            fontFamily: "Mulish-Regular.ttf",
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
