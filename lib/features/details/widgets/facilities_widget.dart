import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/features/details/widgets/facilities_chip.dart';

class FacilitiesWidget extends StatelessWidget {
  const FacilitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const FacilitiesChip(title: "Rental", icon: Icons.sports_soccer),
            FacilitiesChip(
              title: "Showers",
              icon: Icons.shower,
              color: AppColors.lightLink,
            ),
          ],
        ),

        const Gap(10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FacilitiesChip(
              title: "Cafe",
              icon: Icons.coffee,
              color: AppColors.lightLink,
            ),
            const FacilitiesChip(
              title: "Parking",
              icon: Icons.local_parking_rounded,
            ),
          ],
        ),
      ],
    );
  }
}
