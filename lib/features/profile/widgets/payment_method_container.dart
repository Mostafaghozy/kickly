import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/shared/custom_text.dart';

class PaymentMethodContainer extends StatelessWidget {
  const PaymentMethodContainer({
    super.key,
    required this.txt,
    required this.icon,
    required this.onTap,
  });
  final String txt;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.90),

              blurRadius: 6,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                Gap(10),
                CustomText(
                  text: txt,
                  size: 14,
                  weight: FontWeight.w600,
                  color: Colors.black,
                ),
              ],
            ),

            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
