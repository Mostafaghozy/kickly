import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/features/search/widgets/sport_chip.dart';
import 'package:kickly/shared/custom_app_bar_widget.dart';

import 'package:kickly/shared/custom_image_appbar.dart';
import 'package:kickly/shared/custom_rate.dart';
import 'package:kickly/shared/custom_text.dart';
import 'package:kickly/shared/facilities_widget.dart';
import 'package:kickly/shared/row_details_widget.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageAppBar(
            image: "assets/home/stadium.png",
            onBack: () {
              Navigator.pop(context);
            },
            onFavorite: () {
              // Favorite
            },
            onShare: () {
              // Share
            },
          ),
          Gap(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowDetailsWidget(),
                Gap(20),
                Row(
                  children: [
                    SportChip(icon: '⚽', title: 'Football', onTap: () {}),
                    Gap(10),
                    SportChip(title: '5v5', onTap: () {}),
                    Gap(10),
                    CustomRate(rate: '4.7'),
                  ],
                ),
                Gap(20),
                CustomText(
                  text:
                      "A modern five-a-side football field featuring high quality artificial turf, bright floodlights, clean facilities, and convenient parking. Perfect for friendly matches and competitive games.",
                  weight: FontWeight.w200,
                ),
                Gap(20),
                CustomText(text: "Facilities", size: 20),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FacilitiesChip(title: "Rental", icon: Icons.sports_soccer),
                    FacilitiesChip(
                      title: "Showers",
                      icon: Icons.shower,
                      color: AppColors.lightLink,
                    ),
                  ],
                ),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FacilitiesChip(
                      title: "Cafe",
                      icon: Icons.coffee,
                      color: AppColors.lightLink,
                    ),
                    FacilitiesChip(
                      title: "Parking",
                      icon: Icons.local_parking_rounded,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
