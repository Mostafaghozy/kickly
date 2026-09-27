import 'package:flutter/material.dart';

class PersonalDetailsField extends StatelessWidget {
  const PersonalDetailsField({
    super.key,

    required this.hintText,
    this.controller,

    this.keyboardType,
  });

  final TextInputType? keyboardType;

  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: TextField(
        keyboardType: keyboardType,
        // Cursor
        cursorHeight: 18,
        cursorWidth: 1,
        controller: controller,

        style: const TextStyle(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.w600,
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
