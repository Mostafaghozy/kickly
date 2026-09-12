import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BillingTxtField extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const BillingTxtField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: TextField(
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,

        // Cursor
        cursorHeight: 18,
        cursorWidth: 1,

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
