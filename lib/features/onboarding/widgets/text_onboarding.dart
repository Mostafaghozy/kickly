import 'package:flutter/material.dart';

class TextOnboarding extends StatelessWidget {
  const TextOnboarding({
    super.key,
    required this.txt,
    required this.description,
    this.sizeTxt,
    this.sizeDes,
    this.textAlign,
    this.desAlign,
  });

  final String txt;
  final String description;
  final double? sizeTxt;
  final double? sizeDes;
  final TextAlign? textAlign;
  final TextAlign? desAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          txt,
          textAlign: textAlign ?? TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: sizeTxt ?? 22,
            fontWeight: FontWeight.w800,
            fontFamily: "Mulish-Bold.ttf",
          ),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          textAlign: desAlign ?? TextAlign.center,
          style: TextStyle(
            color: Colors.white70,
            fontSize: sizeDes ?? 15,
            fontFamily: "Mulish-Regular.ttf",
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
