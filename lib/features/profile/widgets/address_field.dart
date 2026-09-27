import 'package:flutter/material.dart';

class AddressField extends StatelessWidget {
  const AddressField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Address',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 8),

        SizedBox(
          height: 39,
          child: TextField(
            controller: controller,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,

              contentPadding: const EdgeInsets.symmetric(horizontal: 14),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide.none,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide.none,
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
