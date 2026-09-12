import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardInputField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;

  const CardInputField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: TextField(
        cursorHeight: 18,
        cursorWidth: 1,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontFamily: "Mulish",
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 12,
            color: Color(0xFFB5B9C5),
            fontFamily: "Mulish",
          ),
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, size: 17, color: Colors.black87)
              : null,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 0,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
        ),
      ),
    );
  }
}
