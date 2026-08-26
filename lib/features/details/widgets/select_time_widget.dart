import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/shared/custom_text.dart';

class SelectTimeWidget extends StatefulWidget {
  const SelectTimeWidget({super.key});

  @override
  State<SelectTimeWidget> createState() => _SelectTimeWidgetState();
}

class _SelectTimeWidgetState extends State<SelectTimeWidget> {
  final List<String> selectTime = ['1', '2'];

  int selectedIndex = 1; // 20:00 selected

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: selectTime.length,
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
                text: selectTime[index],
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
