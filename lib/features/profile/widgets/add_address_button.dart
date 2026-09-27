import 'package:flutter/material.dart';
import 'package:kickly/shared/custom_text.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF009B4D),
          foregroundColor: Colors.white,
          elevation: 0,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: 'Add New Address',
              size: 11,
              weight: FontWeight.w700,
              color: Colors.white,
            ),

            Spacer(),

            Icon(Icons.add, size: 17),
          ],
        ),
      ),
    );
  }
}
