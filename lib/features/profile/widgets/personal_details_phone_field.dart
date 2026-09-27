import 'package:flutter/material.dart';

class PersonalDetailsPhoneField extends StatelessWidget {
  const PersonalDetailsPhoneField({
    super.key,
    required this.controller,
    this.onEdit,
    required this.hintText,
  });

  final TextEditingController controller;
  final VoidCallback? onEdit;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: TextField(
        cursorHeight: 18,
        cursorWidth: 1,
        controller: controller,
        keyboardType: TextInputType.phone,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w700,
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

          suffixIcon: IconButton(
            onPressed: onEdit,
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.edit_outlined,
              size: 16,
              color: Color(0xFF60656D),
            ),
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
