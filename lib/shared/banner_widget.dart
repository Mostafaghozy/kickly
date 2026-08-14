import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/shared/custom_text.dart';
import 'package:kickly/shared/image_background.dart';
import 'package:kickly/features/onboarding/widgets/text_onboarding.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
    required this.image,
    required this.txt,
    required this.desc,
  });
  final String image;
  final String txt;
  final String desc;

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
            child: ImageBackground(image: image),
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
                      CustomText(text: txt, color: Colors.white),
                      Gap(8),
                      CustomText(
                        text: desc,
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
