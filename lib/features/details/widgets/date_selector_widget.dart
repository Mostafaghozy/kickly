import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/shared/custom_text.dart';

class DateSelectorWidget extends StatefulWidget {
  const DateSelectorWidget({super.key});

  @override
  State<DateSelectorWidget> createState() => _DateSelectorWidgetState();
}

class _DateSelectorWidgetState extends State<DateSelectorWidget> {
  final List<Map<String, String>> dates = [
    {"day": "Fri", "date": "24"},
    {"day": "Sun", "date": "26"},
    {"day": "Mon", "date": "27"},
    {"day": "Tue", "date": "28"},
    {"day": "Wed", "date": "29"},
    {"day": "Thu", "date": "30"},
    {"day": "Fri", "date": "1"},
    {"day": "Sat", "date": "2"},
  ];

  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Column(
      children: [
        // =========================
        // HEADER
        // =========================
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: "Select Date", size: 20),
            Row(
              children: [
                CustomText(text: "July 2026", size: 15),
                const Gap(10),
                const Icon(Icons.calendar_month, size: 18),
              ],
            ),
          ],
        ),

        const Gap(30),

        // =========================
        // DATES
        // =========================
        SizedBox(
          height: 65,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: dates.length,
            separatorBuilder: (context, index) {
              return const Gap(10);
            },
            itemBuilder: (context, index) {
              final date = dates[index];

              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  width: 62,
                  height: 65,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary
                        : isLight
                        ? Colors.white
                        : Colors.black,
                    borderRadius: BorderRadius.circular(14),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: date["day"]!,
                        weight: FontWeight.w600,
                        color: isSelected ? Colors.white : null,
                      ),

                      const Gap(10),

                      CustomText(
                        text: date["date"]!,
                        size: 15,
                        weight: FontWeight.w700,
                        color: isSelected ? Colors.white : null,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
