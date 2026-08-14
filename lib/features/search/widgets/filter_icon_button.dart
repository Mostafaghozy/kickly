import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kickly/core/constants/app_colors.dart';
import 'package:kickly/features/search/widgets/filter_bottom_sheet.dart';

class FilterIconButton extends StatelessWidget {
  const FilterIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        FocusScope.of(context).unfocus();
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          builder: (context) => const FilterBottomSheet(),
        );
      },
      icon: Icon(
        CupertinoIcons.slider_horizontal_3,
        color: Colors.grey.shade400,
        size: 20,
      ),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}
