import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/shared/custom_text.dart';

class RowDetailsWidget extends StatelessWidget {
  const RowDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: "Nasr city field", size: 20),
            Gap(5),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: isLight ? AppColors.lightLink : Colors.white,
                  size: 15,
                ),
                const Gap(4),
                CustomText(
                  text: 'Nasr city, Cairo',
                  size: 12,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0xff9DFEC8),
            borderRadius: BorderRadius.circular(20),
          ),
          child: CustomText(
            text: 'Available',
            size: 10,
            color: Color(0xff008A3D),
          ),
        ),
      ],
    );
  }
}
