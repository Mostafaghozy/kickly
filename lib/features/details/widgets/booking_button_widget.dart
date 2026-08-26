import 'package:flutter/material.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/shared/custom_text.dart';

class BookingBottomWidget extends StatelessWidget {
  final String price;
  final VoidCallback onBookNow;

  const BookingBottomWidget({
    super.key,
    required this.price,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
      decoration: BoxDecoration(color: AppColors.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: 'Total Price',
                size: 10,
                color: Colors.white,
                weight: FontWeight.w400,
              ),
              const SizedBox(height: 4),
              CustomText(
                text: price,
                size: 20,
                color: Colors.white,
                weight: FontWeight.w700,
              ),
            ],
          ),

          // Book Now button
          SizedBox(
            width: 150,
            height: 40,
            child: ElevatedButton(
              onPressed: onBookNow,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF286EDB),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: CustomText(
                text: 'Book Now',
                size: 14,
                color: Colors.white,
                weight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
