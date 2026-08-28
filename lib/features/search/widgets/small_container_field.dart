import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/shared/custom_text.dart';
import 'package:kickly/shared/image_background.dart';

class SmallContainerField extends StatelessWidget {
  const SmallContainerField({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    final List<Map<String, String>> fields = [
      {
        "name": "Nasr city field",
        "location": "Nasr city, Cairo",
        "price": "E£700/hr",
        "image": "assets/home/stadium.png",
      },
      {
        "name": "AlAhly Field",
        "location": "Nasr city, Cairo",
        "price": "E£600/hr",
        "image": "assets/home/stadium.png",
      },
      {
        "name": "Cairo Stadium",
        "location": "Cairo, Egypt",
        "price": "E£800/hr",
        "image": "assets/home/stadium.png",
      },
      {
        "name": "City Sports Field",
        "location": "New Cairo",
        "price": "E£750/hr",
        "image": "assets/home/stadium.png",
      },
      {
        "name": "Nasr city field",
        "location": "Nasr city, Cairo",
        "price": "E£700/hr",
        "image": "assets/home/stadium.png",
      },
      {
        "name": "AlAhly Field",
        "location": "Nasr city, Cairo",
        "price": "E£600/hr",
        "image": "assets/home/stadium.png",
      },
      {
        "name": "Cairo Stadium",
        "location": "Cairo, Egypt",
        "price": "E£800/hr",
        "image": "assets/home/stadium.png",
      },
      {
        "name": "City Sports Field",
        "location": "New Cairo",
        "price": "E£750/hr",
        "image": "assets/home/stadium.png",
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: fields.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 15,
        childAspectRatio: 0.78,
      ),
      itemBuilder: (context, index) {
        final field = fields[index];

        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade700, width: .7),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: isLight
                    ? Colors.grey.withOpacity(0.80)
                    : Colors.black.withOpacity(0.80),
                blurRadius: 4,
                spreadRadius: 0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              // =========================
              // BACKGROUND IMAGE
              // =========================
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ImageBackground(image: field["image"]!),
                ),
              ),

              // =========================
              // BOTTOM INFORMATION
              // =========================
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isLight
                        ? Colors.white
                        : const Color.fromARGB(255, 37, 39, 40),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(text: field["name"]!, size: 12),

                      const Gap(5),

                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 15,
                            color: isLight
                                ? AppColors.primary
                                : AppColors.darkText,
                          ),

                          const Gap(2),

                          Expanded(
                            child: CustomText(
                              text: field["location"]!,
                              size: 10,
                              weight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),

                      const Gap(5),

                      CustomText(
                        text: field["price"]!,
                        size: 12,
                        color: isLight ? AppColors.primary : AppColors.darkText,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
