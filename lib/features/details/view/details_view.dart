import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/features/details/widgets/availabale_slots_widget.dart';
import 'package:kickly/features/details/widgets/booking_button_widget.dart';
import 'package:kickly/features/details/widgets/select_time_widget.dart';
import 'package:kickly/features/onboarding/widgets/custom_button.dart';
import 'package:kickly/features/search/widgets/sport_chip.dart';
import 'package:kickly/shared/custom_app_bar_widget.dart';

import 'package:kickly/shared/custom_image_appbar.dart';
import 'package:kickly/shared/custom_rate.dart';
import 'package:kickly/shared/custom_text.dart';
import 'package:kickly/features/details/widgets/date_selector_widget.dart';
import 'package:kickly/features/details/widgets/facilities_chip.dart';
import 'package:kickly/features/details/widgets/facilities_widget.dart';
import 'package:kickly/features/details/widgets/location_widget.dart';
import 'package:kickly/features/details/widgets/row_details_widget.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  FacilitiesWidget(),
                  Gap(20),
                  CustomText(text: "Location", size: 20),
                  Gap(20),
                  // Location widget
                  FakeMapWidget(
                    onOpenLocation: () {
                      // Open Google Maps later
                    },
                  ),

                  Gap(20),
                  DateSelectorWidget(),
                  Gap(20),
                  CustomText(text: "Available slots", size: 20),
                  Gap(20),
                  AvailableSlotsWidget(),
                  Gap(20),
                  Row(
                    children: [
                      CustomText(text: "Note", size: 13),
                      CustomText(
                        text:
                            ": Evening booking rates may differ from daytime prices.",
                        weight: FontWeight.w400,
                        size: 12,
                      ),
                    ],
                  ),
                  Gap(50),
                  CustomText(text: "Select hours", size: 20),
                  Gap(10),
                  SelectTimeWidget(),
                  Gap(20),
                ],
              ),
            ),

            BookingBottomWidget(
              price: 'E£500.00',
              onBookNow: () {
                // Handle booking
              },
            ),
          ],
        ),
      ),
    );
  }
}
