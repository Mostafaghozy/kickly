import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/shared/custom_text.dart';
import 'package:kickly/shared/image_background.dart';
import 'package:kickly/features/onboarding/widgets/text_onboarding.dart';

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade700, width: .7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: const ImageBackground(image: "assets/home/first.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Find Your Next Game"),
                      Gap(8),
                      CustomText(
                        text:
                            "Discover nearby sports venues, compare prices, and book your \nfavorite field in just a few taps.",
                        size: 10,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
