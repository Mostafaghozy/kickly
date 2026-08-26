import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/shared/custom_text.dart';

class AvailableSlotsWidget extends StatefulWidget {
  const AvailableSlotsWidget({super.key});

  @override
  State<AvailableSlotsWidget> createState() => _AvailableSlotsWidgetState();
}

class _AvailableSlotsWidgetState extends State<AvailableSlotsWidget> {
  final List<String> timeSlots = [
    '2:00',
    '12:00',
    '13:00',
    '15:00',
    '17:00',
    '18:00',
    '20:00',
    '22:00',
  ];

  int selectedIndex = 6; // 20:00 selected

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: timeSlots.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        childAspectRatio: 2.0,
      ),
      itemBuilder: (context, index) {
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
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
            child: Center(
              child: CustomText(
                text: timeSlots[index],
                weight: FontWeight.w600,
                color: isSelected
                    ? Colors.white
                    : isLight
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
