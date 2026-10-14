import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.txt,
    required this.onPressed,
    this.color,
    this.backgroundColor,
    this.isLoading = false,
  });

  final String txt;
  final VoidCallback onPressed;
  final Color? color;
  final Color? backgroundColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white,
          foregroundColor: color ?? Colors.black,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    color ?? Colors.black,
                  ),
                ),
              )
            : Text(
                txt,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: "Mulish-ExtraBold.ttf",
                  fontWeight: FontWeight.w800,
                ),
              ),
      ),
    );
  }
}
